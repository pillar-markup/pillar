"
I transform a script structure with the associated structure.

S. Ducasse: Check ESUG 2015 with the structures. 

[[[structure=city
{
   ""name""        : ""Bordeaux"",
   ""latitude""    : 44.84, [...]
}
]]]


"
Class {
	#name : #PRScriptStructureTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'structure'
	],
	#category : 'Pillar-ExporterCore-Feature-Structures'
}

{ #category : #creating }
PRScriptStructureTransformer >> createStructureFrom: aScript [
	^ PRStructure new
		tag: aScript structureName;
		structDict: (STON fromString: aScript text) asDictionary;
		yourself
]

{ #category : #'visiting-document' }
PRScriptStructureTransformer >> visitCodeblock: aCodeBlock [
	aCodeBlock isStructure
		ifTrue: [ self replace: (OrderedCollection with: (self createStructureFrom: aCodeBlock)) ]
]
