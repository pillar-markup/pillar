I am the abstract super class of all sub commands for Pillar (export, export-all etc).

I collaborate with a builder to which I pass the information: 
	- configuration file
	- base directory
	- input file
	
and kick its execution. 
Subclasses should set the configurationInstaller