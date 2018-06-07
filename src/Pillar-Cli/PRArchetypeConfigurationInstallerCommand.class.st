"
I'm responsible for handling and installing archetype related templates.

./pillar archetype --template=book

for example. 

There should be a one to one mapping between the argument name and the github/pillar-language/pillar-archetypes folder.

"
Class {
	#name : #PRArchetypeConfigurationInstallerCommand,
	#superclass : #PRAbstractCommand,
	#category : 'Pillar-Cli-Model'
}
