Class {
	#name : #PRHtmlOutput,
	#superclass : #PRWritingTarget,
	#category : 'Pillar-ExporterHTML'
}

{ #category : #accessing }
PRHtmlOutput class >> builderName [
	
	^ #html
]

{ #category : #building }
PRHtmlOutput >> documentFor: aFile [

	^ PRHtmlDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: aFile project outputDirectory / self extension;
		yourself
]

{ #category : #accessing }
PRHtmlOutput >> extension [
	
	^ 'html'
]

{ #category : #accessing }
PRHtmlOutput >> outputDirectoryName [
	
	^ 'html'
]

{ #category : #accessing }
PRHtmlOutput >> writerFor: aPRPillarConfiguration [ 
	
	^ (PRDocumentWriter allSubclasses detect: [ :each | 
		each isAbstract not
			and: [ each writerName = (aPRPillarConfiguration propertyAt: #htmlWriter) ] ])
				new
]
