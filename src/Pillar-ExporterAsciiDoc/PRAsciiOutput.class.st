Class {
	#name : #PRAsciiOutput,
	#superclass : #PRWritingTarget,
	#category : #'Pillar-ExporterAsciiDoc'
}

{ #category : #building }
PRAsciiOutput >> documentFor: aFile [

	^ PRAsciiDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: aFile project outputDirectory / self extension;
		yourself
]

{ #category : #accessing }
PRAsciiOutput >> extension [
	^ 'ascii'
]

{ #category : #accessing }
PRAsciiOutput >> outputDirectoryName [
	
	^ 'ascii'
]

{ #category : #accessing }
PRAsciiOutput >> writerFor: aPRPillarConfiguration [ 
	
	^ PRAsciiDocWriter new
]
