/*   
* Filename	myProj6.cc
* Date		5-5-2019
* Author 	Ben Rust
* Email		bjr170630@utdallas.edu	
* Version 	1.0
* Copyright 2019, All Rights Reserved
*
*Description:
*	This is supposed to read in and print out 
*	the info stored in a binary file
*
*/

#include <iostream>
#include <stdint.h>
#include <cdk.h>

using namespace std;
const int maxRecordStringLength = 25;


class BinaryFileHeader{
public: 
	uint32_t magicNumber;
	uint32_t versionNumber;
	uint64_t numRecords;
};

class BinaryFileRecord{
public:
	uint8_t strLength;
	char stringBuffer[maxRecordStringLength];

};

int main(int argc, char ** argv){


	cout << "Hello World, just to show this is working" << endl;

//	Matrix recMatrix = newCDKMatrix(3, 5);
//	cout << recMatrix.toString() << endl;



/*
	// Create variable to hold header
	BinaryFileHeader myHeader;

	// create input stream
	// Have makefile copy the binary file from perkins' directory 
	// before running
	ifstream binInfile ("cs3377.bin", ios::binary);
		
	// read in the first few bytes
	binInfile.read((char *) myHeader.magicNumber, sizeof(BinaryFileHeader.magicNumber)); 
	
//	cout << "Magic: " << (char*)myHeader.magicNumber << endl;
//	cout << "Version: " myHeader.versionNumber << endl;
//	cout << "NumRecords: " myHeader.numRecords << endl;

*/

	return 0;
}
















