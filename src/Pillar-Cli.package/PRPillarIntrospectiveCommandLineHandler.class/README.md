I'm a special command to let other tool query the value of a configuration wihout having to parse a configuration. 
Here is a typical example of the use of this command line

 	outputDirectory should only be defined in pillar.conf.

	./pharo-ui Pillar.image pillar introspect outputDirectory

	./pharo-ui Pillar.image pillar introspect verbose
	
	./pharo-ui Pillar.image pillar introspect title


./pharo-ui Pillar.image pillar introspect -help
./pharo-ui Pillar.image pillar introspect -configurationFile=pillar.conf
