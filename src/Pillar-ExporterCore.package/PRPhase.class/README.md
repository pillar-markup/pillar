I am an abstract class to describe a Phase of an export. 
A Phase takes an input, transforms it and returns an output.

configuration is the configuration of the export.

To create a new phase you have to define its prority as a class method then to define the action of the Phase with a method actionOn: anInput. This method will return an output. 