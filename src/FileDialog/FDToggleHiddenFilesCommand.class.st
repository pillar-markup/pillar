"
i'm manage ContextMenu to display/NotDisplay hidenFile 

"
Class {
	#name : #FDToggleHiddenFilesCommand,
	#superclass : #CmCommand,
	#category : #'FileDialog-Menu'
}

{ #category : #hooks }
FDToggleHiddenFilesCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	self context toggleHiddenFiles
]

{ #category : #hooks }
FDToggleHiddenFilesCommand >> initialize [
	super initialize.
	self
		basicName: 'Toggle hidden files';
		basicDescription: 'appear/unappear hidden files'
]
