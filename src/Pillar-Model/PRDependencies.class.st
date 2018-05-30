"
I'm a visitor used to compute file and image dependencies using a cache. 
I should be moved to a separate package. Probably together with the Command Line handlers that expose the functionalities to the command line. 
"
Class {
	#name : #PRDependencies,
	#superclass : #PRVisitor,
	#instVars : [
		'cachedDependencies'
	],
	#category : 'Pillar-Model-Visitor - Non Core'
}

{ #category : #accessing }
PRDependencies >> cachedDependencies [
	^ cachedDependencies 
]

{ #category : #visiting }
PRDependencies >> start: aDocument [
	cachedDependencies := Set new.
	super start: aDocument.
	^ cachedDependencies.
]
