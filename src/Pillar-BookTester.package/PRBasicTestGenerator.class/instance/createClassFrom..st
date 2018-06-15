visiting
createClassFrom: aFileName

	self className: aFileName asSymbol.
	(TestCase subclass: className
   		instanceVariableNames: ''
    	classVariableNames: ''
    	package: 'Pillar-BookTesterResults').
		