Class {
	#name : 'PRPdfOutput',
	#superclass : 'PRWritingTarget',
	#category : 'Pillar-ExporterLaTeX',
	#package : 'Pillar-ExporterLaTeX'
}

{ #category : 'accessing' }
PRPdfOutput class >> builderName [
	
	^ #pdf
]

{ #category : 'building' }
PRPdfOutput >> documentFor: aFile [

	^ PRPDFDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: aFile project outputDirectory / self extension;
		yourself
]

{ #category : 'writing' }
PRPdfOutput >> exampleWriterSetting [

	^ '#''miclatex:sbabook'''
]

{ #category : 'accessing' }
PRPdfOutput >> extension [
	
	^ 'pdf'
]

{ #category : 'accessing' }
PRPdfOutput >> outputDirectoryName [
	
	^ 'pdf'
]

{ #category : 'accessing' }
PRPdfOutput >> writerFor: aPRPillarConfiguration [ 
	
	^ self writerFor: aPRPillarConfiguration forConfigurationTag: #latexWriter
]

{ #category : 'writing' }
PRPdfOutput >> writerNames [

	^ #( 'micBeamer' 'miclatex' 'miclatex:sbabook' )
]
