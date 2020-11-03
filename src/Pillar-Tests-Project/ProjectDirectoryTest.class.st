Class {
	#name : #ProjectDirectoryTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-Project'
}

{ #category : #tests }
ProjectDirectoryTest >> testDefaultOuputDirectory [
	| fileSystem project goodDir |
	
	fileSystem := FileSystem memory root.
	goodDir := (fileSystem / 'PharoBook80126') ensureCreateDirectory .
	
	project := PRProject on: fileSystem / 'PharoBook80126'.
	
	self assert: project baseDirectory equals: goodDir.
	self assert: project outputDirectory equals: goodDir / project defaultOutputDirectoryName.
]
