Class {
	#name : #PRMicrodownOutput,
	#superclass : #PRWritingTarget,
	#category : #'Pillar-ExporterMarkdown'
}

{ #category : #accessing }
PRMicrodownOutput class >> builderName [
	^ 'microdown'
]

{ #category : #building }
PRMicrodownOutput >> documentFor: aFile [

	^ PRMicrodownDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: aFile project outputDirectory / self extension;
		yourself
]

{ #category : #accessing }
PRMicrodownOutput >> extension [
	
	^ 'microdown'
]

{ #category : #accessing }
PRMicrodownOutput >> outputDirectoryName [
	
	^ 'microdown'
]

{ #category : #accessing }
PRMicrodownOutput >> writerFor: aPRPillarConfiguration [ 
	
	^ PRMicrodownWriter new
]
