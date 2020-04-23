"
I'm a inspect command use to inspect the selectedFile
"
Class {
	#name : #FDInspectCommand,
	#superclass : #CmCommand,
	#category : #'FileDialog-Menu'
}

{ #category : #hooks }
FDInspectCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."

	self context fileReferenceTable selection selectedItem inspect
]

{ #category : #initialization }
FDInspectCommand >> initialize [
	super initialize.
	self
		basicName: 'Inspect file';
		basicDescription: 'Inspect the selected file'
]
