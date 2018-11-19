"
I allow to create a symbolic Link
"
Class {
	#name : #PRCreateSymLink,
	#superclass : #PRBasicObject,
	#category : 'Pillar-ExporterCore-Utilities'
}

{ #category : #system }
PRCreateSymLink >> createSymbolic: name to: target [
	| command |
	command :='ln -sf ' , target , ' ' , name.
	name asFileReference exists
		ifTrue: [ command := 'unlink ', name , '; ' , command ].
	self system: command
]

{ #category : #system }
PRCreateSymLink >> system: command [
	"Perform OS system() call."
	^ self ffiCall: #(#int #system #(#char #* #command)) module: LibC
]
