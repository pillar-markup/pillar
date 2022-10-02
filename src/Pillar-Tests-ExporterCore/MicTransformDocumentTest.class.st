Class {
	#name : #MicTransformDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'filesystem',
		'builder',
		'project',
		'file',
		'aPRPDFDocument'
	],
	#category : #'Pillar-Tests-ExporterCore-Base'
}

{ #category : #running }
MicTransformDocumentTest >> generateFilesystemExample [

	| file |
	(filesystem workingDirectory / 'Chapters') createDirectory.
	(filesystem workingDirectory / 'Chapters' / 'Chapter1') createDirectory.
	file := filesystem workingDirectory / 'Chapters' / 'Chapter1' / 'chapter1.md'.
	file writeStreamDo: [ :stream | stream nextPutAll: '
Pharo is cool

![](figures/f.png)
' ].
    
]

{ #category : #initialization }
MicTransformDocumentTest >> setUp [
	super setUp.
	filesystem := FileSystem memory.
	self generateFilesystemExample.
	project := PRProject new baseDirectory: filesystem. 
	file := filesystem / 'Chapters' / 'Chapter1' / 'chapter1.md'.
	aPRPDFDocument := PRPDFDocument new project: project; 
		file: (MicMicrodownInputDocument new
					project: project;
					file:  file) ; 
		target: PRPdfOutput new.
]

{ #category : #initialization }
MicTransformDocumentTest >> testTransformDocumentFor [
	
	| parsedDocument transformedDocument |
	parsedDocument := MicrodownParser parse: file readStream contents.
	transformedDocument := parsedDocument transformDocumentFor: aPRPDFDocument.
	
	self assert: transformedDocument children second children first reference path equals:  '/Chapters/Chapter1/figures/f.png'
]
