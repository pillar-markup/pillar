"
I'm a previewer for JPG , jpeg file 
	I provide a SpImagePresenter to show the picture
"
Class {
	#name : #FDJPGPreviewer,
	#superclass : #FDAbstractPreviewer,
	#category : #'FileDialog-previewerStrategie'
}

{ #category : #testing }
FDJPGPreviewer >> matchingMimeType: aZnMimeType [
	"return a Boolean to indicate if element matches"

	^ aZnMimeType matches: ZnMimeType imageJpeg
]

{ #category : #utils }
FDJPGPreviewer >> previewActionOn: aFileReference [
	^ SpImagePresenter new
		image:
			(aFileReference
				binaryReadStreamDo: [ :stream | JPEGReadWriter formFromStream: stream ]);
		yourself
]
