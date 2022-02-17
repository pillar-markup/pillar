Class {
	#name : #PRInputFileFinderTest,
	#superclass : #TestCase,
	#instVars : [
		'memory',
		'filesystem',
		'index'
	],
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
PRInputFileFinderTest class >> indexPillar [

	^ '%reviewed SD: 4th of march
${inputFile:path=Chapters/Preface/Preface.pillar}$

${inputFile:path=Chapters/PharoTour/PharoTour.pillar}$
%Reviewed finished

${inputFile:path=Chapters/Counter/Exo-Counter.pillar}$

${inputFile:path=Chapters/FirstApplication/FirstApplication.pillar}$

${inputFile:path=Chapters/IcebergIntro/StartedWithIceberg.pillar}$ 
%cha:Iceberg
${inputFile:path=Chapters/IcebergIntro/FirstConfiguration.pillar}$
%@cha:configure

%reviewed SD: 4th of march
${inputFile:path=Chapters/SyntaxNutshell/SyntaxNutshell.pillar}$

%reviewed SD: 4th of march
${inputFile:path=Chapters/UnderstandingMessage/UnderstandingMessage.pillar}$


%reviewed SD: 6th of march
${inputFile:path=Chapters/PharoObjectModel/PharoObjectModel.pillar}$

%To be finished
${inputFile:path=Chapters/PharoObjectModel/Traits.pillar}$

%Under reviewed SD: 7th of April HERE
${inputFile:path=Chapters/SUnit/SUnit.pillar}$

${inputFile:path=Chapters/BasicClasses/BasicClasses.pillar}$

${inputFile:path=Chapters/Collections/Collections.pillar}$

${inputFile:path=Chapters/Streams/Streams.pillar}$

%migrated and reviewed SD: 7th of April
${inputFile:path=Chapters/Morphic/Morphic.pillar}$

${inputFile:path=Chapters/Metaclasses/Metaclasses.pillar}$

${inputFile:path=Chapters/Reflection/Reflection.pillar}$
'
]

{ #category : #running }
PRInputFileFinderTest >> setUp [
	super setUp.
	filesystem := FileSystem memory.
	index := filesystem workingDirectory / 'index.pillar'.
	index writeStreamDo: [ :stream | stream nextPutAll: self class indexPillar ].
	
]

{ #category : #running }
PRInputFileFinderTest >> testFinderFindInputFiles [

	| files |
	files := PRInputFileFinder new 
		start: (PRPillarParser parse: index contents);
		files.
	self assert: files size equals: 17
		
]

{ #category : #running }
PRInputFileFinderTest >> testFinderFindInputFilesFromFileIndex [

	
	| files |
	files := (PRInputFileFinder fromFileIndex: index) files.
	self assert: files size equals: 17
		
]
