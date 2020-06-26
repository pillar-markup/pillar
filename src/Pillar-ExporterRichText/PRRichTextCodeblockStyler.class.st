"
!!! Purpose
I am a class to manage code styling for different programming languages and formats.

I am able to style ==smalltalk== code, and provides a plugin architecture for other formats.


!!!! Plugin
To define a new styler for a different language or format you should do the following

- The name of the language to use for formatting is specified ==[[[language=Foolang==, or ==[[[Foolang==. 
- A styler should implement a class method which takes a ==String== argument, and returns a formatted/styled ==Text==.
- That class method should have a pragma of the format ==<codeblockStylerFor:Foolang>==. See the example in this class for Smalltalk

					

"
Class {
	#name : #PRRichTextCodeblockStyler,
	#superclass : #Object,
	#category : #'Pillar-ExporterRichText-Core'
}
