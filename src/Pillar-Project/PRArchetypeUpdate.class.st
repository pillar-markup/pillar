"
I report what an update of the support files of a book did (`pillar updateArchetype`): the archetype installed, the files of the new `_support` that were added, changed or removed compared with the previous one (kept in `_support-previous`), and whether `_custom` was created.

## Life cycle: who creates me and who uses me

1. `PRArchetype>>updateIn:` creates me after it moved the old `_support` to `_support-previous`, installed the new one and created `_custom` when it was missing; it compares the two support folders to fill me.
2. `ClapPillarUpdateArchetypeCommand>>execute` prints me with `summaryOn:` so that the author knows which of their old files to look at.

## Responsibility:

- Know the archetype and the paths (relative to `_support`) of the added, changed and removed files.
- Know whether `_custom` was created.
- Write a summary for the author.

## Collaborators: 

- `PRArchetype`: creates me.
- `ClapPillarUpdateArchetypeCommand`: prints me.

## Public API and Key Messages

- `addedFiles`, `changedFiles`, `removedFiles`: sorted relative paths.
- `hasCreatedCustom`
- `summaryOn: aStream`
- `PRArchetypeUpdate class>>archetypeName:previousSupport:newSupport:` compares two support folders.

## Examples

```
PRArchetypeUpdate exampleOfAnUpdate
```
"
Class {
	#name : 'PRArchetypeUpdate',
	#superclass : 'Object',
	#instVars : [
		'archetypeName',
		'addedFiles',
		'changedFiles',
		'removedFiles',
		'hasCreatedCustom'
	],
	#category : 'Pillar-Project',
	#package : 'Pillar-Project'
}

{ #category : 'instance creation' }
PRArchetypeUpdate class >> archetypeName: aString previousSupport: aPreviousSupport newSupport: aNewSupport [
	"Answer the update that installed aNewSupport from the archetype named aString in place of aPreviousSupport."

	^ self new
		  archetypeName: aString;
		  compare: aPreviousSupport with: aNewSupport;
		  yourself
]

{ #category : 'examples' }
PRArchetypeUpdate class >> exampleOfAnUpdate [
	"The update of a book whose book.css was edited by its author, from a version of the archetype that adds a style sheet and removes another one."

	<sampleInstance>
	| fileSystem |
	fileSystem := FileSystem memory.
	{
		('previous/html/css/book.css' -> 'edited by the author').
		('previous/html/css/old.css' -> 'removed by the archetype').
		('new/html/css/book.css' -> 'new version').
		('new/html/css/custom-fonts.css' -> 'added by the archetype') } do: [
			:each |
			| file |
			file := fileSystem root resolve: each key.
			file parent ensureCreateDirectory.
			file writeStreamDo: [ :stream | stream nextPutAll: each value ] ].
	^ self
		  archetypeName: 'bod-book-latex2026'
		  previousSupport: fileSystem / 'previous'
		  newSupport: fileSystem / 'new'
]

{ #category : 'accessing' }
PRArchetypeUpdate >> addedFiles [

	^ addedFiles
]

{ #category : 'accessing' }
PRArchetypeUpdate >> archetypeName [

	^ archetypeName
]

{ #category : 'accessing' }
PRArchetypeUpdate >> archetypeName: aString [

	archetypeName := aString
]

{ #category : 'accessing' }
PRArchetypeUpdate >> changedFiles [

	^ changedFiles
]

{ #category : 'comparing' }
PRArchetypeUpdate >> compare: aPreviousSupport with: aNewSupport [
	"Fill the added, changed and removed files of aNewSupport compared with aPreviousSupport, which may not exist."

	| previous new |
	previous := self filesOf: aPreviousSupport.
	new := self filesOf: aNewSupport.
	addedFiles := (new keys reject: [ :each | previous includesKey: each ])
		              sorted asArray.
	removedFiles := (previous keys reject: [ :each |
		                 new includesKey: each ]) sorted asArray.
	changedFiles := (new keys select: [ :each |
			                 (previous includesKey: each) and: [
					                 (self contentsOf: (previous at: each))
					                 ~= (self contentsOf: (new at: each)) ] ]) sorted
		                asArray
]

{ #category : 'comparing' }
PRArchetypeUpdate >> contentsOf: aFile [

	^ aFile binaryReadStreamDo: [ :stream | stream upToEnd ]
]

{ #category : 'comparing' }
PRArchetypeUpdate >> filesOf: aDirectory [
	"Answer the files of aDirectory indexed by their path relative to it, without hidden files such as .DS_Store, which are not part of the support."

	| files |
	files := Dictionary new.
	aDirectory exists ifFalse: [ ^ files ].
	aDirectory allFiles do: [ :each |
			(each basename beginsWith: '.') ifFalse: [
				files at: (each relativeTo: aDirectory) fullName put: each ] ].
	^ files
]

{ #category : 'accessing' }
PRArchetypeUpdate >> hasCreatedCustom [

	^ hasCreatedCustom
]

{ #category : 'accessing' }
PRArchetypeUpdate >> hasCreatedCustom: aBoolean [

	hasCreatedCustom := aBoolean
]

{ #category : 'initialization' }
PRArchetypeUpdate >> initialize [

	super initialize.
	addedFiles := #(  ).
	changedFiles := #(  ).
	removedFiles := #(  ).
	hasCreatedCustom := false
]

{ #category : 'accessing' }
PRArchetypeUpdate >> removedFiles [

	^ removedFiles
]

{ #category : 'printing' }
PRArchetypeUpdate >> summaryOn: aStream [
	"Write for the author what the update did, and which files of _support-previous to look at."

	aStream
		nextPutAll: 'Updated _support from the archetype ';
		nextPutAll: archetypeName;
		nextPutAll: ': ';
		print: addedFiles size;
		nextPutAll: (addedFiles size = 1
				 ifTrue: [ ' file' ]
				 ifFalse: [ ' files' ]);
		nextPutAll: ' added, ';
		print: changedFiles size;
		nextPutAll: ' changed, ';
		print: removedFiles size;
		nextPutAll: ' removed.';
		lf.
	self writeFilesToLookAtOn: aStream.
	hasCreatedCustom ifTrue: [
			aStream
				nextPutAll:
					'Created _custom: put your changes to the look of the book there (see _custom/README.md).';
				lf ]
]

{ #category : 'printing' }
PRArchetypeUpdate >> writeFilesToLookAtOn: aStream [
	"Write the files of the previous support that the new one changed or removed: the author may have edited them."

	(changedFiles isEmpty and: [ removedFiles isEmpty ]) ifTrue: [
			^ aStream
				  nextPutAll:
					  'No file of the previous _support differs from the new one: you can delete _support-previous.';
				  lf ].
	aStream
		nextPutAll:
			'The previous _support is kept in _support-previous. These of its files differ from the new version:';
		lf.
	changedFiles do: [ :each |
			aStream
				nextPutAll: '  changed: ';
				nextPutAll: each;
				lf ].
	removedFiles do: [ :each |
			aStream
				nextPutAll: '  removed: ';
				nextPutAll: each;
				lf ].
	aStream
		nextPutAll:
			'If you had changed some of them, move your changes into _custom (see doc/book-layout.md), then delete _support-previous.';
		lf
]
