"
I test `PRArchetype`: where the archetypes are found, both in a released Pillar (an `archetypes` folder next to the image) and in a development image (the `archetypes` folder of the Pillar repository).
"
Class {
	#name : 'PRArchetypeTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Tests-Project',
	#package : 'Pillar-Tests-Project'
}

{ #category : 'tests' }
PRArchetypeTest >> testArchetypesDirectoryIsTheFirstCandidateThatExists [

	| fileSystem |
	fileSystem := FileSystem memory.
	(fileSystem / 'repository' / 'archetypes') ensureCreateDirectory.

	self
		assert: (PRArchetype archetypesDirectoryAmong: {
					 (fileSystem / 'image' / 'archetypes').
					 (fileSystem / 'repository' / 'archetypes') })
		equals: fileSystem / 'repository' / 'archetypes'
]

{ #category : 'tests' }
PRArchetypeTest >> testArchetypesDirectoryIsTheFirstCandidateWhenNoneExists [

	| fileSystem |
	fileSystem := FileSystem memory.

	self
		assert: (PRArchetype archetypesDirectoryAmong: {
					 (fileSystem / 'image' / 'archetypes').
					 (fileSystem / 'repository' / 'archetypes') })
		equals: fileSystem / 'image' / 'archetypes'
]

{ #category : 'tests' }
PRArchetypeTest >> testArchetypesDirectoryPrefersTheFirstCandidate [

	| fileSystem |
	fileSystem := FileSystem memory.
	(fileSystem / 'image' / 'archetypes') ensureCreateDirectory.
	(fileSystem / 'repository' / 'archetypes') ensureCreateDirectory.

	self
		assert: (PRArchetype archetypesDirectoryAmong: {
					 (fileSystem / 'image' / 'archetypes').
					 (fileSystem / 'repository' / 'archetypes') })
		equals: fileSystem / 'image' / 'archetypes'
]

{ #category : 'tests' }
PRArchetypeTest >> testCandidateDirectoriesStartNextToTheImage [

	self
		assert: PRArchetype candidateArchetypesDirectories first
		equals: FileLocator imageDirectory asFileReference / 'archetypes'
]

{ #category : 'tests' }
PRArchetypeTest >> testDirectoryIsTheGivenOne [

	| fileSystem |
	fileSystem := FileSystem memory.

	self
		assert: (PRArchetype new
				 name: 'welcome';
				 directory: fileSystem / 'mine';
				 yourself) directory
		equals: fileSystem / 'mine'
]

{ #category : 'tests' }
PRArchetypeTest >> testDirectoryOfAKnownArchetypeExists [

	self assert: (PRArchetype new
			 name: 'welcome';
			 yourself) directory exists
]

{ #category : 'tests - errors' }
PRArchetypeTest >> testValidateExistsOfAnUnknownArchetypeRaisesError [

	| fileSystem |
	fileSystem := FileSystem memory.

	self
		should: [
				(PRArchetype new
					 name: 'unknown';
					 directory: fileSystem / 'unknown';
					 yourself) validateExists ]
		raise: Error
]
