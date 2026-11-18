"
I am signaled when Pillar needs the archetype a book was created from and the book has no `_support/archetypeID` file, for example when `pillar updateArchetype` is run without an archetype name in a book that was not created by `pillar archetype`.

## Life cycle: who creates me and who uses me

1. `PRProject>>installedArchetypeName` signals me when `_support/archetypeID` does not exist.
2. The command line reports my message to the author, who then gives the archetype name: `pillar updateArchetype bod-book-latex2026`.

## Responsibility:

- Tell that the archetype of the book is unknown and how to give it.

## Collaborators: 

- `PRProject`: signals me.

## Examples

```
PRMissingArchetypeID exampleSignal
```
"
Class {
	#name : 'PRMissingArchetypeID',
	#superclass : 'PRCommandError',
	#category : 'Pillar-Project',
	#package : 'Pillar-Project'
}

{ #category : 'examples' }
PRMissingArchetypeID class >> exampleSignal [
	"Signal the error a book without _support/archetypeID gives, as pillar updateArchetype shows it."

	<example>
	^ self new signal
]

{ #category : 'accessing' }
PRMissingArchetypeID >> messageText [

	^ messageText ifNil: [
		  'This book has no _support/archetypeID: give the name of its archetype, for example pillar updateArchetype bod-book-latex2026' ]
]
