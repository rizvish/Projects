/*
 * ProcessStates.h
 *
 *  Created on: Apr 20, 2016
 *      Author: Bao Pham, Syed Rizvi
 */

#include <list>
#include <map>
#include <iostream>
#include "Pcb.h"
#ifndef PROCESSSTATES_H_
#define PROCESSSTATES_H_

class ProcessStates {
public:
	std::list<Pcb> processList;		//list of processes to be added to new at a specified arrival time
	std::list<Pcb> newState;		//list of new processes
	std::map<int,Pcb> blockedState;	//list of blocked processes
	std::list<Pcb> exitState;		//queue of completed processes
	std::list<Pcb> readyState;		//queue of processes in Ready state
	std::list<Pcb> runningState;	//current running process
	int iD = 1;						//holds the pID to assign to the next process

	void addToProcessList(Pcb process);
	void newToReady();
	void readyToRun();
	void runToReady();
	void runToBlocked();
	void runToExit();
	void addToNew(Pcb n);
	void blockedToReady(Pcb blocked);
	void increment();

	ProcessStates();
	virtual ~ProcessStates();
};

#endif /* PROCESSSTATES_H_ */
