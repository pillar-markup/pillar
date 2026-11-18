"
I am an error caused by what the author asked or by the state of their book (an unknown archetype, a missing file, a folder that is not empty…), not by a bug of Pillar. My message is written for the author: the command line prints it as `pillar: <message>` and exits with a failure, without a stack trace.

## Life cycle: who creates me and who uses me

1. Pillar signals me, or one of my subclasses (`PRMissingArchetypeID`), when it checks a request before doing any work.
2. `ClapPillarCommand>>executeOrPrintHelp` catches me and `ClapPillarCommand>>reportError:` prints my message.

## Responsibility:

- Carry a message that tells the author what is wrong and what to do.

## Collaborators: 

- `ClapPillarCommand`: reports me.

## Examples

```
PRCommandError exampleSignal
```
"
Class {
	#name : 'PRCommandError',
	#superclass : 'Error',
	#category : 'Pillar-Project',
	#package : 'Pillar-Project'
}

{ #category : 'examples' }
PRCommandError class >> exampleSignal [
	"Signal an error as the command line reports it: pillar: Unknown archetype nosuch."

	<example>
	^ self new
		  messageText: 'Unknown archetype nosuch.';
		  signal
]
