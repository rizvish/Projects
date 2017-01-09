/*
 * Dispatcher.cpp
 *
 *  Created on: Apr 24, 2016
 *      Author: Bao Pham, Syed Rizvi
 */

#include "Dispatcher.h"

int Dispatcher::ram[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

Dispatcher::Dispatcher() {
	// TODO Auto-generated constructor stub

}

/*
 * This method iterates through the new state and adds processes to the ready state if there is enough memory in RAM
 */
void Dispatcher::moveToReady(){
	//For each process in the New State, if the amount of memory is less than the available RAM,
	//move the process to Ready State
	if(!ps.newState.empty()){
		if(ps.newState.front().getMemory() <= calcRam()){
			addToRam(ps.newState.front());
			ps.newToReady();
			changed = true;
		}
	}
}


/*
 * This method iterates through the blocked state and check to see if the IO request has been completed, and moves the
 * process to ready if so.
 */
void Dispatcher::removeFromBlocked(){
	std::map<int, Pcb>::iterator iterator;			//iterator
	std::list<Pcb> remove;							//list of processes to remove from blocked state
	std::list<Pcb>::iterator it;					//iterator for list of Pcb to remove

	//for each process in the blocked state
	for(iterator = ps.blockedState.begin(); iterator != ps.blockedState.end(); ){
		int element = iterator->second.iOCompleted;		//element of the iOTime array to check

		//If the IO Time of the specified element of the array is equal to zero
		if(iterator->second.iOTime[element] == 0){
			//decrement the amount of IO's to go
			iterator->second.iOToGo--;
			//increment the amount of IO's completed
			iterator->second.iOCompleted++;
			//create a temporary pcb
			Pcb btr = iterator->second;
			//add to the list of Pcb's to remove
			remove.push_back(btr);
			changed = true;
		}
		else{
			//decrement the IO Time at the specified element
			iterator->second.iOTime[element]--;
			iterator++;
		}
	}
	//for each process in the list, remove from blocked and move to ready
	for(it = remove.begin(); it != remove.end(); it++){
		ps.blockedToReady(*it);
	}
}



/*
 * This method moves the running process to Exit State
 */
void Dispatcher::moveToExit(){
	//If the amount of CPU used by the running process is equal to the amount of CPU Time needed
	//by the running process
	if (ps.runningState.front().cpuUsed == ps.runningState.front().cpuTime){
		//move the running process to exit,
		ps.runToExit();

		//remove the process from RAM and running state
		removeFromRam(ps.runningState.front());
		ps.runningState.pop_front();

		//state change occurred
		changed = true;

		//reset the timeslice
		timeSlice = 0;

	}
}

/*
 * This method moves processes to the run state
 */
void Dispatcher::moveToRun(){
	bool check = (ps.runningState.size() == 0 && ps.readyState.size() > 0);
	bool check2 = (ps.runningState.size() > 0 || ps.readyState.size() > 0);
	changed = true;
	//check if the run state is empty and readyState is not empty, and add a process from ready to run if true
	if (check){
		ps.readyToRun();
		timeSlice = 0;
	}
	//else, there is a process in run, so check if it has used up all of the timeslice,
	//and move from run to ready and ready to run if necessary.
	else if(timeSlice == 10 && check2){
		ps.runToReady();
		ps.readyToRun();
		timeSlice = 0;
	}
	else{
		changed = false;
	}
	ps.increment();
}

/*
 * This method adds processes to the New State
 */
void Dispatcher::moveToNew(){

	std::list<Pcb>::iterator iterator;		//iterator to traverse through processes

	//For every process in the list, if the arrival time of the process is equal to the current clock cycle,
	//add the process to the New State and assign it a unique pID
	for (iterator = ps.processList.begin(); iterator != ps.processList.end(); ++iterator) {
		if(iterator->getAt() == clockCycle){
			ps.addToNew(*iterator);
			ps.newState.back().setId(ps.iD);
			ps.iD++;
			changed = true;
		}
	}
}

/*
 * This method adds processes to the Blocked State
 */
void Dispatcher::moveToBlocked(){
	int element = ps.runningState.front().iOCompleted;		//element of the io request in the array
	//if the running state is not empty
	if(ps.runningState.size() != 0){
		if(ps.runningState.front().iOArrive[element] == ps.runningState.front().cpuUsed){
			ps.runToBlocked();
			changed = true;
		}
	}
}

/*
 * This method assigns memory to a process
 */
void Dispatcher::addToRam(Pcb process){
	int memToAdd = process.getMemory();				//The amount of memory to add
	//Calculate the available RAM
	calcRam();
	//If the amount of memory to add is less than or equal the available RAM
	if(memToAdd <= calcRam()){

		//For each Mb in RAM, if the Mb of RAM is empty and  there is still memory to assign,
		//assign the Mb of RAM and decrement the amount of memory to assign.
		for(int i = 0; i < 16; i++){
			if(ram[i] == 0 && memToAdd > 0){
				ram[i] = process.getId();
				memToAdd--;
			}
		}

	}
}

/*
 * This method calculates available RAM
 */
int Dispatcher::calcRam(){
	int count = 0;		//counter

	//For each Mb in RAM, if the element in the Mb is 0, increment counter.
	for(int i = 0; i < 16; i++){
		if(ram[i] == 0){
			count++;
		}
	}
	availableRam = count;
	return count;
}

/*
 * This method removes a process from ram
 */
void Dispatcher::removeFromRam(Pcb process){

	//For each Mb of ram, if the element in the Mb is the process to be removed,
	//remove from ram and set the Mb to zero.
	for(int i = 0; i < 16; i++){
		if(ram[i]==process.getId()){
			ram[i] = 0;
		}
	}
}

Dispatcher::~Dispatcher() {
	// TODO Auto-generated destructor stub
}

