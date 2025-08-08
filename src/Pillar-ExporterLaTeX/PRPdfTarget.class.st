Class {
	#name : 'PRPdfTarget',
	#superclass : 'PRWritingTarget',
	#category : 'Pillar-ExporterLaTeX',
	#package : 'Pillar-ExporterLaTeX'
}

{ #category : 'accessing' }
PRPdfTarget class >> builderName [
	
	^ #pdf
]

{ #category : 'building' }
PRPdfTarget >> documentFor: aFile [

	^ PRPDFDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: aFile project outputDirectory / self extension;
		yourself
]

{ #category : 'accessing' }
PRPdfTarget >> extension [
	
	^ 'pdf'
]

{ #category : 'accessing' }
PRPdfTarget >> outputDirectoryName [
	
	^ 'pdf'
]

{ #category : 'accessing' }
PRPdfTarget >> writerFor: aPRPillarConfiguration [ 
	
	^ self writerFor: aPRPillarConfiguration forConfigurationTag: #latexWriter
]
