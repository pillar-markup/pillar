I am an abstract class to represent an open-ended syntax for special text. The syntax of the annotation is the following: 

	${note:value=some text|value2="some text"}$

The name at the begining of each annote is called the tag (e.g., 'index', 'note', 'cite'). The tag is followed by a series of associations (key/value pairs).

Each annotation has the possibility to define a default parameter that does not need to be explicitly tagged: 
	 ${mock:Foo|number=5}$ means  ${mock:value=Foo|number=5}$ since mock defines defaultParameterName as 'value'.


!! Description

I allow one to extend easily the syntax of Pillar. I am contained inside a PRDocumentGroup. I am define by a tag and I can have some parameters.

!! Public API and Key Messages
- #tag This class method define the tag of an annotation.

- #parameters: aCollection   This class method is the constructor of an annotation. This method takes a dictionary of parameters.

!!Internal Representation and Key Implementation Points.
 
Instance Variables
-	hadAllKeys:	I am a boolean. I  know if all the parameters written by the user had a key or if one didn't had a key. To export the document, this is useless except for the Pillar writer.
-	parameters:	I  keep all the parameters of the annotation with a key and a value.
