configurations
findDefaultConfigurationNamed: aString
	"Search for a default configuration named ==aString== by asking the document writer classes for their default configurations. Raise an exception if no writer class defines a configuration named ==aString==. If a writer class defines such a configuration, merge its properties."
	| writerClass defaultConfiguration newConfiguration |
	writerClass := PRDocumentWriter allSubclasses
		detect: [ :each | each isAbstract not and: [ each defaultConfigurationName = aString ] ]
		ifNone: [ PRConfigurationError signal: 'No default configuration named: ' , aString ].
	defaultConfiguration := writerClass defaultConfiguration.
	newConfiguration := self class new.
	newConfiguration parent: self.
	defaultConfiguration properties
		keysDo:
			[ :propertyName | 
			(newConfiguration inheritsPropertyAt: propertyName)
				ifFalse:
					[ 
					newConfiguration
						propertyAt: propertyName
						put: (defaultConfiguration propertyAt: propertyName) ] ].
	^ newConfiguration