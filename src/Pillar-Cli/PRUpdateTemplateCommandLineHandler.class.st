"
I am a command line handler to update the template of the current project.
I overwrite the current template in the support folder.
I assume that the support folder is read only and the user did not modify it.

Example of usage:

./pillar updateTemplate book
"
Class {
	#name : #PRUpdateTemplateCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : 'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRUpdateTemplateCommandLineHandler class >> commandName [
	^ 'updateTemplate'
]

{ #category : #activation }
PRUpdateTemplateCommandLineHandler >> activate [

	self project installTemplateNamed: self requestedTemplate.
	self exitSuccess
]

{ #category : #activation }
PRUpdateTemplateCommandLineHandler >> requestedTemplate [

	| nonOptions |
	self optionAt: 'template' ifPresent: [ :value | ^ value ].

	"also managed ./pillar updateTemplate book (to be backward compatible)"
	nonOptions := self arguments reject: [ :a | a beginsWith: '-' ].
	^ nonOptions size = 1
		ifTrue: [ nonOptions last ]
		ifFalse: [ self errorMissingParameter: 'template' ].
]
