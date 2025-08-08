Class {
	#name : 'PRHtmlTarget',
	#superclass : 'PRWritingTarget',
	#category : 'Pillar-ExporterHTML',
	#package : 'Pillar-ExporterHTML'
}

{ #category : 'accessing' }
PRHtmlTarget class >> builderName [
	
	^ #html
]

{ #category : 'building' }
PRHtmlTarget >> documentFor: aFile [

	^ PRHtmlDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: aFile project outputDirectory / self extension;
		yourself
]

{ #category : 'accessing' }
PRHtmlTarget >> extension [
	
	^ 'html'
]

{ #category : 'accessing' }
PRHtmlTarget >> outputDirectoryName [
	
	^ 'html'
]

{ #category : 'accessing' }
PRHtmlTarget >> writerFor: aPRPillarConfiguration [ 
	
	^ self writerFor: aPRPillarConfiguration forConfigurationTag: #htmlWriter
]
