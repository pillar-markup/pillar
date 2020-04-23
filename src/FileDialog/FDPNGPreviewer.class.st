"
i'm creating 

a SpImagePresenter of PNG file
"
Class {
	#name : #FDPNGPreviewer,
	#superclass : #FDAbstractPreviewer,
	#category : #'FileDialog-previewerStrategie'
}

{ #category : #testing }
FDPNGPreviewer >> matchingMimeType: element [
	^ element matches:  ZnMimeType imagePng
]

{ #category : #utils }
FDPNGPreviewer >> previewActionOn: aFileReference [
	^ SpImagePresenter new
		image:
			(aFileReference
				binaryReadStreamDo: [ :stream | PNGReadWriter formFromStream: stream ]);
		yourself
]
