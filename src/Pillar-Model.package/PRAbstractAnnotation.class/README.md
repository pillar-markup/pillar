I am an abstract class to represent an open-ended syntax for special text.

Description
----------------------------

I allow to extend easily the syntax of Pillar. I am contained inside a PRDocumentGroup. I am define by a tag and I can have some parameters.

Public API and Key Messages
----------------------------

- #tag
    This class method define the tag of an annotation.

- #parameters: aCollection
    This class method is the constructor of an annotation. This method take a dictionary of parameters.

Example 
----------------------------

I am an abstract class, I should not be use directly.

Internal Representation and Key Implementation Points.
----------------------------

    Instance Variables
	hadAllKeys:		I am a boolean. I  know if all the parameters write by the user had a key or if one didn't had a key. To export the document, this is useless except for the Pillar writer.
	parameters:		I  keep all the parameters of the annotation with a key and a value.
			

The name at the begining of each annote is called the tag (e.g., 'index', 'note', 'cite'). The tag is followed by a series of associations (key/value pairs).

Todo
------------------------

- ${todo} to represent a position in the text where things must be changed
- ${note:value=some text}$ (equivalent to previous one) (the default value= works the same as for Java annotations);
- ${index:AClass}$ to add AClass to the document index;
- ${cite:Duca99b}$ to reference a particular item of a bibliography;
- ${cite:value=Duca99b|page=90}$ (equivalent to previous one but additionaly specifies a page number;
- ${background:file://foobar.png}$ to specify the background of the current section;
- ${toc:maxLevel=2}$ to show a table of content with only level 1 and 2 section headings.
- ${note:some text with a curly brace \} inside}$ (shows how to escape a curly brace).