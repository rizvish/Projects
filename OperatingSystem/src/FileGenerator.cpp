/*
 * FileGenerator.cpp
 *
 *  Created on: May 1, 2016
 *      Author: Bao Pham, Syed Rizvi
 */

#include "FileGenerator.h"
#include <stdlib.h>
#include <fstream>
#include <time.h>
#include <iostream>
#include <algorithm>


FileGenerator::FileGenerator() {
	// TODO Auto-generated constructor stub

}

/*
 * This method creates random numbers and writes it to the file
 */
void FileGenerator:: generate(int processes){
	//ostream object
	std::ofstream ofs;
	//open txt file
	ofs.open("testing.txt");
	srand(time(NULL));
	//Create 60 lines (processes) to write to the file.
	for(int i = 0; i < processes; i++){
		//random arrival time between 0 and 1000
		int randArrival = rand() % (1000 - 0);
		//random memory between 1-8Mb
		int randMem = 1 + rand() % (8 - 1);
		//random CPU Time between 10-950 clock cycles
		int randCpuTime = 10 + rand() % (950 - 10);
		//random number of IO requests between 0-5
		int randIOreq = rand() % 5;
		//array to hold IO Arrival times
		int randIOA[5];
		//array to hold IO Time
		int randIOT[5];
		//temporary array to hold IO arrival times, and sort from least to greatest
		int aTemp[randIOreq];
		for(int x = 0; x < 5; x++){
			//if i is less than the number of requests
			if(x < randIOreq){
				//generate a random number between 0 and randCpuTime
				aTemp[x] = 1 + rand() % (randCpuTime-1);
				//generate a random number between 25 and 50;
				randIOT[x] = 25 + rand() % (50 - 25);
			}
			else{
				//set element of array to 0
				randIOT[x] = 0;
			}
		}
		//write the variables to txt file
		ofs << randArrival << "," << randMem << "," << randCpuTime << "," << randIOreq << ",";
		//sort temporary array
		std::sort(aTemp, aTemp + randIOreq);
		//for each item in randIOA, assign the appropriate values
		for(int j = 0; j < 5; j++){
			if(j < randIOreq){
				randIOA[j] = aTemp[j];
			}
			else{
				randIOA[j] = 0;
			}
			ofs << randIOA[j] << ",";
		}
		for(int k =0; k < 5; k++){
			ofs << randIOT[k] << ",";
		}
		ofs << std::endl;
	}
	ofs.close();
}
FileGenerator::~FileGenerator() {
	// TODO Auto-generated destructor stub
}

