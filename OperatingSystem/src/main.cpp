/*
 * main.cpp
 *
 *  Created on: Apr 20, 2016
 *      Author: Bao Pham, Syed Rizvi
 */

#include <iostream>
#include <queue>
#include "Pcb.h"
#include "ProcessStates.h"
#include "Dispatcher.h"
#include <fstream>
#include <string>
#include <sstream>
#include <iomanip>
#include "FileGenerator.h"
#include <stdlib.h>
#include <unistd.h>
#include <ncurses.h>

using namespace std;

//This variable keeps track of user response
static int response = 0;

/*
 * Static method that accepts a process state list, iterates through the process state and prints out
 * the Process ID of each process in the state.
 */
void iterateList(list<Pcb> pState){
	std::list<Pcb>::iterator iterator;
	for (iterator = pState.begin(); iterator != pState.end(); ++iterator) {
		std::cout << iterator->getId() << setw(3);
	}
	cout << "\n";
}

/*
 * Static method that iterates through the active process state and prints the process ID, IO to go, IO completed, Cpu used, and Cpu total
 * of each process.
 */
void iterateActiveList(list<Pcb> activeState){
	std::list<Pcb>::iterator iterator;
	for (iterator = activeState.begin(); iterator != activeState.end(); ++iterator) {
		std::cout << "\tProcess " << iterator->getId() << " CPU used: "  << iterator->cpuUsed <<
				" Total CPU: " << iterator->cpuTime << " IO Completed: " << iterator->iOCompleted
				<< " IO To Go: " << iterator->iOToGo << endl;
	}
	cout << "\n";
}

/*
 * This method displays the processes currently in RAM
 */
void displayRam(int ram[]){
	cout << "RAM: " << endl;
	for(int i = 0; i < 16; i++){
		cout << ram[i] << setw(4);
	}
	cout<< "\n";
}

/*
 * This method iterates through the blocked states map and prints out the process ID, IO to go, IO completed, Cpu used, and Cpu to go
 * of each process
 */
void iterateBlocked(map<int,Pcb> bState){
	std::map<int, Pcb>::iterator iterator;
	for(iterator = bState.begin(); iterator != bState.end(); iterator++){
		cout << "\tProcess " << iterator->second.getId() << " CPU Used: " << iterator->second.cpuUsed << " Total CPU: " << iterator->second.cpuTime <<
				" IO Completed: " << iterator->second.iOCompleted <<  " IO To Go: " << iterator->second.iOToGo << endl;
	}
	cout << "\n";
}

/*
 * This method displays every state as well as RAM
 */
void displayOS(Dispatcher dis){
	if(dis.changed){
		cout << "\n\n";
		cout << "CLOCK CYCLE: " << dis.clockCycle << endl;
		displayRam(dis.ram);
		cout << "New state: " << endl;
		iterateList(dis.ps.newState);
		cout << "Ready state: " << endl;
		iterateActiveList(dis.ps.readyState);
		cout << "Run state: " <<  endl;
		iterateActiveList(dis.ps.runningState);
		cout << "Blocked state: " <<endl;
		iterateBlocked(dis.ps.blockedState);
		cout << "Exit state: " << endl;
		iterateList(dis.ps.exitState);

		//Check user response. If 1, then run to completion
		if(response == 1){
			sleep(1);
		}
	}
}

string getLine1(ifstream& in)
{
	std::string result;
	std::string line;
	getline(in, line);
	result += line + "\n";
	return result;
}

int main(){
	int ans;
	int numOfProcesses;
	cout << "Would you like to generate a new input file? (1 if yes. 0 if no)" << endl;
	cin >> ans;
	//if user entered 1, generate new file
	if(ans == 1){
		//create file generator object and generate a new file
		FileGenerator gen;
		cout << "How many processes would you like to generate?" << endl;
		cin >> numOfProcesses;
		gen.generate(numOfProcesses);
	}
	else{
		cout << "How many processes are being input?" << endl;
		cin >> numOfProcesses;
	}

	//create a dispatcher object
	Dispatcher dispatcher;
	//stringstream object to convert comma delimited string to int
	std::istringstream is;
	//ifstream object to read from file
	ifstream file("testing.txt");

	if(file.is_open())
	{
		string s;
		//read in 60 lines
		for(int k = 0; k < numOfProcesses; k++)
		{
			//create pcb object to hold process information
			Pcb process;
			//get next line from file
			s = getLine1(file);

			std::string::size_type n=0;

			while((n = s.find(',',n)) != std::string::npos) //npos - while not end of the line
			{
				s.replace(n,1,1,' ');
				n++;
			}

			is.str(s);
			//set the process arrival time, memory, cpu time, and number of IO requests
			is >> process.at >>process.memory>> process.cpuTime>>process.iOToGo;

			//set IO arrival times
			for(int i = 0; i < 5; i++){
				is >> process.iOArrive[i];
			}
			//set IO wait time
			for(int j = 0; j < 5; j++){
				is >> process.iOTime[j];
			}
			//push the process to processList
			dispatcher.ps.addToProcessList(process);
		}
		file.close();
	}
	else
		std::cout<<"Unable to open file\n";


	bool stillToDo = true;
	while(stillToDo){
		//Move processes to New State
		dispatcher.moveToNew();
		//Display if any changes were made, prompt for input or run to completion
		displayOS(dispatcher);
		if(dispatcher.changed && response !=1){
			cout << "Enter 1 to run to completion. Otherwise, enter any number" << endl;
			cin >> response;
		}
		dispatcher.changed = false;

		//Move processes to Ready State
		dispatcher.moveToReady();
		//Display if any changes were made, prompt for input or run to completion
		displayOS(dispatcher);
		if(dispatcher.changed && response !=1){
			cout << "Enter 1 to run to completion. Otherwise, enter any number" << endl;
			cin >> response;
		}
		dispatcher.changed = false;

		//Move process to Run
		dispatcher.moveToRun();
		//Display if any changes were made, prompt for input or run to completion
		displayOS(dispatcher);
		if(dispatcher.changed && response !=1){
			cout << "Enter 1 to run to completion. Otherwise, enter any number" << endl;
			cin >> response;
		}
		dispatcher.changed = false;

		//Increment Clock Cycle  and TimeSlice Counter
		dispatcher.clockCycle++;
		dispatcher.timeSlice++;


		//dispatcher.ps.runningState.front().cpuUsed++;

		//Move process to Exit
		//Display if any changes were made, prompt for input or run to completion
		dispatcher.moveToExit();
		displayOS(dispatcher);
		if(dispatcher.changed && response !=1){
			cout << "Enter 1 to run to completion. Otherwise, enter any number" << endl;
			cin >> response;
		}
		dispatcher.changed = false;

		//move processes to the blocked state
		//Display if any changes were made, prompt for input or run to completion
		dispatcher.moveToBlocked();
		displayOS(dispatcher);
		if(dispatcher.changed && response !=1){
			cout << "Enter 1 to run to completion. Otherwise, enter any number" << endl;
			cin >> response;
		}
		dispatcher.changed = false;
		//remove processes from the blocked state
		//Display if any changes were made, prompt for input or run to completion
		dispatcher.removeFromBlocked();
		displayOS(dispatcher);
		if(dispatcher.changed && response !=1){
			cout << "Enter 1 to run to completion. Otherwise, enter any number" << endl;
			cin >> response;
		}
		dispatcher.changed = false;

		//if all of the processes are in exit, exit the loop
		if(dispatcher.ps.exitState.size() == numOfProcesses){
			stillToDo = false;
		}
	}


	return 0;
}
