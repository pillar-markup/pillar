Class {
	#name : #PRMarkdownOutput,
	#superclass : #PRWritingTarget,
	#category : #'Pillar-ExporterHTML'
}

{ #category : #building }
PRMarkdownOutput >> documentFor: aFile [

	^ PRMarkdownDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: aFile project outputDirectory / self extension;
		yourself
]

{ #category : #accessing }
PRMarkdownOutput >> extension [
	^ 'markdown'
]

{ #category : #accessing }
PRMarkdownOutput >> outputDirectoryName [
	
	^ 'markdown'
]

{ #category : #accessing }
PRMarkdownOutput >> writerFor: aPRPillarConfiguration [ 
	
	^ PRMarkdownWriter new
]
