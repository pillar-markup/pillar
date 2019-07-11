"
I am a Class used by any of the Pillar-BookTester package. Tests made in this package can test method/class definitions here. PRBookTesterVisitor may need to create classes or methods and they should all be subclasses of PRBookTestDummyClass in a way.

On the other hand, the package Pillar-BookTesterResults should only be used by PillarTestGenerator.

Pillar-BookTesterResults splits in two packages: 
	- TestResults used by PRBookTestGenerator tests 
	- Books when using the command createTests on a book
"
Class {
	#name : #PRBookTestDummyClassTest,
	#superclass : #TestCase,
	#category : #'Pillar-BookTester-Visitor-Tests'
}
