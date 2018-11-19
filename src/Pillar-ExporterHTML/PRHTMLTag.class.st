"
I'm a helper class to generate HTML code.

!! Example 

For example, to generate: 

[[[
    <p>foo <a href=""url"">bar</a></b>
]]]
You can write something like this:

[[[
String streamContents: [ :stream | | canvas |
	stream := PROutputStream on: stream.
	canvas := PRHTMLCanvas on: stream.
	canvas tag
 		name: 'p';
 		with: [ canvas nextPutAll: 'foo '.
			    canvas tag 
	     		      name: 'a';
	    			parameterAt: 'href' put: 'url';
	                  with: 'bar' ]	 ]
]]]
!! About with: argument 

Pay attention there is a difference between a block and a string as argument of the with: message.

Using a string	simply puts the string as body of the tag.
[[[
	canvas tag 	
		name: 'xx';
		with: 'foo'.
]]]

While when the argument is a block the block result is not used, just executed. 
[[[ 
	canvas tag 	
		name: 'xx';
		with: [ self foo ] 
]]]
"
Class {
	#name : #PRHTMLTag,
	#superclass : #PRHTMLBrush,
	#instVars : [
		'name'
	],
	#category : 'Pillar-ExporterHTML'
}

{ #category : #accessing }
PRHTMLTag >> name: aString [
	name := aString.
	stream nextPut: $<; << aString
]

{ #category : #accessing }
PRHTMLTag >> parameterAt: aString put: anotherString [
	stream space. stream << aString << '="' << anotherString << '"'
]

{ #category : #accessing }
PRHTMLTag >> with: aString [
	stream 
		nextPut: $>; 
		<< aString;
		<< '</'; 
		<< name;
		nextPut: $>
]
