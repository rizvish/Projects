/*
 * Pcb.h
 *
 *  Created on: Apr 20, 2016
 *      Author: Bao Pham, Syed Rizvi
 */

#ifndef PCB_H_
#define PCB_H_
#include <queue>

class Pcb {
public:

	int memory;					//Amount in Mb of memory needed
	int at;						//Arrival time of process
	int cpuTime;				//Amount of cpu time needed
	int cpuUsed;				//Amount of cpu time used
	int iOToGo;					//# of I/O's left (starts at total I/O requests)
	int iOCompleted = 0;		//# of I/O's completed(starts at 0)
	int iOArrive[5];			//The time when IO request occurs in clock cycles
	int iOTime[5];				//The amount of CPU time needed for I/O request to complete

	Pcb();
	virtual ~Pcb();


	int getIOToGo();
	void setIOToGo(int toGo);
	int getIOCompleted();
	void setIOCompleted(int completed);
	void setIOArrival(int arrival[5]);
	void setIOTime(int time[5]);

	int getAt();
	void setAt(int at);
	int getCpuTime();
	void setCpuTime(int cpuTime);
	int getCpuUsed();
	void setCpuUsed(int cpuUsed);
	int getMemory();
	void setMemory(int memory);
	int getId();
	void setId(int id);
private:
	int pID;			//Unique process ID number
};

#endif /* PCB_H_ */
