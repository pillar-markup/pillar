Class {
	#name : #PRBuildRootMainStrategyTest,
	#superclass : #PRBuildStrategyTest,
	#category : #'Pillar-Tests-ExporterCore-Base'
}

{ #category : #tests }
PRBuildRootMainStrategyTest >> testFilesToBuildOnCorrect [
	| outputProject |
	outputProject := PRBuildRootMainStrategy new filesToBuildOn: project.
	self assert: outputProject first class equals: PRInputDocument.
	self assert: outputProject first file path equals: Path / 'index.pillar'
]

{ #category : #tests }
PRBuildRootMainStrategyTest >> testFilesToBuildOnErrorNoFile [
	project baseDirectory: ((project baseDirectory / 'index.pillar') delete; parent).
	self should: [ PRBuildRootMainStrategy new filesToBuildOn: project ] raise: Error
]

{ #category : #tests }
PRBuildRootMainStrategyTest >> testFilesToBuildOnErrorSeveralFiles [
	project baseDirectory: ((project baseDirectory / 'chap3.pillar') ensureCreateFile; parent).
	self should: [ PRBuildRootMainStrategy new filesToBuildOn: project ] raise: Error
]
