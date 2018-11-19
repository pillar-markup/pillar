Class {
	#name : #PRPdfOutput,
	#superclass : #PRWritingTarget,
	#category : 'Pillar-ExporterLaTeX'
}

{ #category : #accessing }
PRPdfOutput class >> builderName [
	
	^ #pdf
]

{ #category : #building }
PRPdfOutput >> documentFor: aFile [

	^ PRPDFDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: aFile project outputDirectory / self extension;
		yourself
]

{ #category : #accessing }
PRPdfOutput >> extension [
	
	^ 'pdf'
]

{ #category : #accessing }
PRPdfOutput >> outputDirectoryName [
	
	^ 'pdf'
]

{ #category : #accessing }
PRPdfOutput >> writerFor: aPRPillarConfiguration [ 
	
	^ (PRDocumentWriter allSubclasses detect: [ :each | 
		each isAbstract not
			and: [ each writerName = (aPRPillarConfiguration propertyAt: #latexWriter) ] ])
				new
]
