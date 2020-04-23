"
I'm a previewer use to display the content of a file 
"
Class {
	#name : #FDContentPreviewer,
	#superclass : #FDAbstractPreviewer,
	#category : #'FileDialog-previewerStrategie'
}

{ #category : #testing }
FDContentPreviewer >> matchingMimeType: aZnMimeType [
	"return a Boolean to indicate if element matches"
	^ true
]

{ #category : #templateMethod }
FDContentPreviewer >> previewActionOn: aFileReference [
	^ SpTextPresenter new text: aFileReference contents 
]
