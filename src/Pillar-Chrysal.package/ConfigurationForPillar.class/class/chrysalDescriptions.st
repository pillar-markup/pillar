description
chrysalDescriptions
 ^ STON fromString: '[
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
		#explanation : ''Indicate how to convert from the level of a Pillar heading to the level of heading in your exported document.\r\tFor example, a headingLevelOffset of 3 converts a 1st level Pillar heading to an <h4>in HTML''
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
		#default : ''build''
	},
	FolderConfigurationItem {
		#propertyName : #baseDirectory,
		#default : ''.''
	},
	FileConfigurationItem {
		#propertyName : #outputFile,
		#default : ''output'',
		#explanation : ''If separateOutputFiles is false, indicate the name of the output file. This can also be a write stream.''
	},
	FileConfigurationItem {
		#propertyName : #mainDocument,
		#default : ''book''
	},
	FileConfigurationItem {
		#propertyName : #inputFile,
		#default : ''book'',
		#explanation : ''The Pillar file that must be transformed. You can also specify an input file at the end of the command-line interface. Previously there was no default value''
	},
	StringConfigurationItem {
		#propertyName : #latexTemplate,
		#default : ''_support/templates/main.latex.mustache''
	},
	BooleanConfigurationItem {
		#propertyName : #scrambledEmailAddresses,
		#default : ''false''
	},
	BooleanConfigurationItem {
		#propertyName : #separateOutputFiles,
		#default : ''false'',
		#explanation : ''If true, each input file is exported to one output file. If false (the default), all input files are exported to outputFile.''
	},
	BooleanConfigurationItem {
		#propertyName : #renderStructureAsSlide,
		#default : ''true'',
		#explanation : ''When true (the default), Pillar will create a dedicated slide for each Pillar header. This parameter is meaningless when generating a written document''
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
		#default : #unix,
		#explanation : ''The string that separates lines in the exported document. This is often either LF or CR\\+LF but any string is possible. Values are #(#cr #lf #crlf #unix #mac #dos)'',
		#defaultKey : #unix
	},
	StringConfigurationItem {
		#propertyName : #latexWriter,
		#default : #''latex:sbabook''
	},
	StringConfigurationItem {
		#propertyName : #htmlWriter,
		#default : #html
	},
	NumberConfigurationItem {
		#propertyName : #slideInTemplateForDeckJS,
		#default : 1,
		#explanation : ''Number of slides in Template: Indicate the number of slides created by the DeckJS template. This is important to create anchors.''
	},
	CodeBlockDefaultLanguageItem {
		#propertyName : #defaultScriptLanguage,
		#explanation : ''Indicate the language in scripts when none is specified. This language is used for syntax highlighting. The currently supported languages are bash, css, html, http, json, javascript, pillar, sql, ston, shellcommands and smalltalk''
	},
	CompositeConfigurationItem {
		#propertyName : #levelSpecification,
		#default : #PRTitlePrinterSpecification,
		#fields : [
			#level,
			#renderAs,
			#capitalization,
			#numbering,
			#headerSize
		]
	},
	ListConfigurationItem {
		#propertyName : #levels,
		#default : #OrderedCollection,
		#element : #levelSpecification
	}
]'