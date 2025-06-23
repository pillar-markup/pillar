Class {
	#name : 'PRNoInputDocument',
	#superclass : 'PRInputDocument',
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'registration' }
PRNoInputDocument class >> doesHandleExtension: anExtension [

	^ false
]

{ #category : 'accessing' }
PRNoInputDocument >> parserClass [ 
	"may be the error should not be raised here."
	
	self error: 'Extension file ', file extension, 'not recognized'
]
