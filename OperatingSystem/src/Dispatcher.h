/*
 * Dispatcher.h
 *
 *  Created on: Apr 24, 2016
 *      Author: Bao Pham, Syed Rizvi
 */

#ifndef DISPATCHER_H_
#define DISPATCHER_H_
#include <list>
#include "ProcessStates.h"



class Dispatcher {
public:
	ProcessStates ps;		//Process states of the OS
	int availableRam;
	static int ram[];		//Available ram. Each element of the array represents 1Mb. 0 = free memory
	int clockCycle = 0;		//Counter for clock cycle
	int timeSlice = 0;		//Counter for time slice
	bool changed = false;


	Dispatcher();
	void moveToReady();
	void moveToExit();
	void removeFromBlocked();
	void moveToRun();
	void moveToNew();
	void moveToBlocked();
	void addToRam(Pcb process);
	int calcRam();
	void removeFromRam(Pcb process);
	virtual ~Dispatcher();
};

#endif /* DISPATCHER_H_ */
