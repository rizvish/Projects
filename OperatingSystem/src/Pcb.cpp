/*
 * Pcb.cpp
 *
 *  Created on: Apr 20, 2016
 *      Author: Bao Pham, Syed Rizvi
 */

#include <iostream>
#include "Pcb.h"


Pcb::Pcb() {
	// TODO Auto-generated constructor stub

}

/*
 * Getter for arrivalTime
 */
int Pcb::getAt(){
	return at;
}

/*
 * Setter for arrivalTime
 */
void Pcb::setAt(int at) {
	this->at = at;
}

/*
 * Getter for cpuUsed
 */
int Pcb::getCpuUsed(){
	return cpuUsed;
}

/*
 * Setter for cpuTime
 */
void Pcb::setCpuUsed(int cpuUsed) {
	this->cpuUsed = cpuUsed;
}

/*
 * Getter for cpuTime
 */
int Pcb::getCpuTime(){
	return cpuTime;
}

/*
 * Setter for cpuTime
 */
void Pcb::setCpuTime(int cpuTime) {
	this->cpuTime = cpuTime;
}

/*
 * Getter for memory needed
 */
int Pcb::getMemory(){
	return memory;
}

/*
 * Setter for memory needed
 */
void Pcb::setMemory(int memory) {
	this->memory = memory;
}

/*
 * Getter for Process ID
 */
int Pcb::getId(){
	return pID;
}

/*
 * Setter for Process ID
 */
void Pcb::setId(int id) {
	pID = id;
}

int Pcb::getIOToGo(){
	return iOToGo;
}

void Pcb::setIOToGo(int toGo){
	iOToGo = toGo;
}

int Pcb::getIOCompleted(){
	return iOCompleted;
}

void Pcb::setIOCompleted(int completed){
	iOCompleted = completed;
}

void Pcb::setIOArrival(int arrival[5]){
	for(int i = 0; i < 5; i++){
		iOArrive[i] = arrival[i];
		}
}

void Pcb::setIOTime(int time[5]){
	for(int i = 0; i < 5; i++){
	iOTime[i] = time[i];
	}
}

Pcb::~Pcb() {
	// TODO Auto-generated destructor stub
}

