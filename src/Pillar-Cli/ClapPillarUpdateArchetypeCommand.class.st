"
I am the command `pillar updateArchetype [name]`: I update the support files of the current book from its archetype, without losing the changes of the book (see `doc/commands.md` and `doc/book-layout.md` in the Pillar repository).

Without a name, the archetype is the one recorded in `_support/archetypeID`; with a name, the book switches to that archetype. The old `_support` is kept in `_support-previous`, `_custom` is never changed, and I print what changed.

## Life cycle: who creates me and who uses me

1. Clap creates me from my `commandSpecification` when the command line is `pillar updateArchetype`.
2. `execute` asks the `PRProject` of the working directory to update (`updateArchetype` or `updateArchetypeNamed:`) and prints the `PRArchetypeUpdate` it answers.

## Responsibility:

- Read the optional archetype name.
- Run the update and print its summary.

## Collaborators: 

- `PRProject`: runs the update.
- `PRArchetypeUpdate`: the summary I print.

## Examples

**Example of usage:** `pillar updateArchetype` or `pillar updateArchetype bod-book-latex2026`.
"
Class {
	#name : 'ClapPillarUpdateArchetypeCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-Cli',
	#package : 'Pillar-Cli'
}

{ #category : 'accessing' }
ClapPillarUpdateArchetypeCommand class >> commandName [

	^ 'updateArchetype'
]

{ #category : 'command line' }
ClapPillarUpdateArchetypeCommand class >> commandSpecification [

	<commandline>
	^ (ClapCommandSpec id: self commandName asSymbol)
		  description:
			  'Update the support files (_support) of the book from its archetype, keeping its _custom folder and the old _support in _support-previous';
		  commandClass: self;
		  addHelp;
		  addPositional: #requestedArchetype spec: [ :positional |
				  positional
					  description:
						  'Archetype to use, the one in _support/archetypeID by default';
					  defaultValue: [ '' ] ];
		  yourself
]

{ #category : 'execution' }
ClapPillarUpdateArchetypeCommand >> execute [

	| update |
	update := self requestedArchetype isEmpty
		          ifTrue: [ self project updateArchetype ]
		          ifFalse: [
		          self project updateArchetypeNamed: self requestedArchetype ].
	self outputStreamDo: [ :stream | update summaryOn: stream ]
]

{ #category : 'execution' }
ClapPillarUpdateArchetypeCommand >> requestedArchetype [

	^ (self positional: #requestedArchetype) asString
]
