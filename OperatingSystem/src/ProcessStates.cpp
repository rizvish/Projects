/*
 * ProcessStates.cpp
 *
 *  Created on: Apr 20, 2016
 *      Author: Bao Pham, Syed Rizvi
 */

#include "ProcessStates.h"

ProcessStates::ProcessStates() {
	// TODO Auto-generated constructor stub

}

/*
 * If the running state is empty, this method will increment the cpu time used by the process in the running state
 */
void ProcessStates::increment(){
	if(!runningState.empty())
	runningState.front().cpuUsed++;
}

/*
 * This method pushes a process on to the processList (initial list of processes before going into the system)
 */
void ProcessStates::addToProcessList(Pcb process){
	processList.push_back(process);
}
/*
 * This method removes a specified Pcb from the new state and pushes it to the ready state queue
 */
void ProcessStates::newToReady(){
	Pcb ntr = newState.front();
	newState.pop_front();
	readyState.push_back(ntr);
}

/*
 * This method moves a pcb from ready to new.
 */
void ProcessStates::readyToRun(){
	runningState.push_back(readyState.front());
	readyState.pop_front();
}

/*
 * This method moves the running process to the ready state
 */
void ProcessStates::runToReady(){
	readyState.push_back(runningState.front());
	runningState.pop_front();
}

/*
 * This method moves the running process to the blocked state
 */
void ProcessStates::runToBlocked(){
	int id = runningState.front().getId();
	Pcb process = runningState.front();
	blockedState.insert(std::pair<int, Pcb>(id, process));
	runningState.pop_front();
}

/*
 * This pushes the running state object on to the exit state queue.
 */
void ProcessStates::runToExit(){
	exitState.push_back(runningState.front());
}

/*
 *  This method removes a specified Pcb from the blocked state and pushes it to the ready state queue
 */
void ProcessStates::blockedToReady(Pcb blocked){
	std::map<int, Pcb>::iterator iterator;
	iterator = blockedState.find(blocked.getId());
	if(iterator != blockedState.end()){
		blockedState.erase(iterator);
		readyState.push_back(blocked);
	}
}

/*
 * This method accepts a Pcb object and pushes it to the new state queue
 */
void ProcessStates::addToNew(Pcb toNew){
	newState.push_back(toNew);
}


ProcessStates::~ProcessStates() {
	// TODO Auto-generated destructor stub
}

