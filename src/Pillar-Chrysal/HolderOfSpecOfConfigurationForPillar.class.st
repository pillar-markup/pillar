"
Methods were generated doing

```

ChrysalConfigurationBuilder new 
	configurationClass: ConfigurationForPillar;
	withDescriptionItems: HolderOfSpecOfConfigurationForPillar ForMicrodownChrysalDescriptions 

```

"
Class {
	#name : 'HolderOfSpecOfConfigurationForPillar',
	#superclass : 'Object',
	#category : 'Pillar-Chrysal',
	#package : 'Pillar-Chrysal'
}

{ #category : 'description' }
HolderOfSpecOfConfigurationForPillar class >> ForMicrodownChrysalDescriptions [
	"I'm the description that generates all the rest
	doing 
	
	ChrysalConfigurationBuilder new 
		configurationClass: ConfigurationForPillar2;
		withDescriptionItems: ConfigurationForPillar2 ForMicrodownChrysalDescriptions
	
	"
	
	 ^ STON fromString: '[
	PathConfigurationItem {
		#propertyName : #bibFile,
		#default : ''book.bib'',
		#explanation : ''Identify the file to be taken as input for the bibliography. This is the .bib file used to resolve the ${cite:ref=Key}$ annotation.''
	},
	StringConfigurationItem {
		#propertyName : #title,
		#default : ''my super cool book''
	},
	StringConfigurationItem {
		#propertyName : #attribution,
		#default : ''me, myself and I''
	},
	NumberConfigurationItem {
		#propertyName : #headingLevelOffset,
		#default : 0,
		#explanation : ''Indicate how to convert from the level of a heading to the level of heading in your exported document.\r\tFor example, a headingLevelOffset of 3 converts a 1st level heading to an <h4>in HTML''
	},
	StringConfigurationItem {
		#propertyName : #series,
		#default : ''Square Bracket Associate Collection''
	},
	StringConfigurationItem {
		#propertyName : #keywords,
		#default : ''Pharo''
	},
	PathConfigurationItem {
		#propertyName : #outputDirectory,
		#default : ''_result''
	},
	FolderConfigurationItem {
		#propertyName : #baseDirectory,
		#default : ''.''
	},
	FileConfigurationItem {
		#propertyName : #mainDocument,
		#default : ''book''
	},
	FileConfigurationItem {
		#propertyName : #inputFile,
		#default : ''index'',
		#explanation : ''The file that must be transformed. You can also specify an input file at the end of the command-line interface. Previously there was no default value''
	},
	StringConfigurationItem {
		#propertyName : #latexTemplate,
		#default : ''_support/templates/main.latex.mustache''
	},
	StringConfigurationItem {
		#propertyName : #latexChapterTemplate,
		#default : ''_support/templates/chapter.latex.mustache''
	},
	StringConfigurationItem {
		#propertyName : #htmlTemplate,
		#default : ''_support/templates/html.mustache''
	},
	StringConfigurationItem {
		#propertyName : #htmlChapterTemplate,
		#default : ''_support/templates/html.mustache''
	},
	NewLineConfigurationItem {
		#propertyName : #newLine,
		#default : #platform,
		#explanation : ''The string that separates lines in the exported document. This is often either LF or CR\\+LF but any string is possible. Values are #(#cr #lf #crlf #unix #mac #dos #platform)'',
		#defaultKey : #platform
	},
	StringConfigurationItem {
		#propertyName : #latexWriter,
		#default : #''miclatex:sbabook''
	},
	StringConfigurationItem {
		#propertyName : #htmlWriter,
		#default : #michtml
	},
	NumberConfigurationItem {
		#propertyName : #slideInTemplateForDeckJS,
		#default : 1,
		#explanation : ''Number of slides in Template: Indicate the number of slides created by the DeckJS template. This is important to create anchors.''
	},
	ListConfigurationItem {
		#propertyName : #levels,
		#default : #OrderedCollection,
		#element : #levelSpecification
	},
	PathConfigurationItem {
		#propertyName : #tocFile,
		#default : ''.'',
		#explanation : ''Identify the file to be taken as input for the root of the table of contents. When it is not specified, the table of contents will not be computed and displayed''
	},
	ListConfigurationItem {
		#propertyName : #onlyCheckers,
		#explanation : ''Identify the checker names that should only be considered. The list given by ignoredCheckers is not considered. Still checkers can be configured via checkerConfigurations field.'',
		#default : #OrderedCollection,
		#element : #value
	},
	ListConfigurationItem {
		#propertyName : #ignoredCheckers,
		#explanation : ''Identify the checker names that should be ignored when onlyCheckers is not used.'',
		#default : #OrderedCollection,
		#element : #value
	},
	ListConfigurationItem {
		#propertyName : #checkerConfigurations,
		#explanation : ''Specify some configurations for each of the checkers mentioned either in onlyCheckers or ignoredCheckers.'',
		#default : #OrderedCollection,
		#element : #value
	}
]'
]
