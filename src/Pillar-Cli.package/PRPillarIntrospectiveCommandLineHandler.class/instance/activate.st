activation
activate
	| confFilename value request args specialAccess |
	
	specialAccess := #('chapters').
	"specialaccess are requests that are not directly handle by executing a message on the configuration."
	"evil hack for now before we get a real query. may be a block"
	
	self activateHelp
		ifTrue: [ ^ self ].
	
	confFilename := self
		optionAt: 'configurationFile'
		ifAbsent: [ self class defaultConfigurationFileName ].
	
	self
		optionAt: 'baseDirectory'
		ifPresent: [ :dir | baseDirectory := dir asFileReference ].

	configuration := self configurationFrom: confFilename.
	args := commandLine arguments reject: [ :each | each beginsWith: '-' ].
	
	args isEmpty
		ifTrue: [ ^ self ].
	request := args first.
	(specialAccess includes: request)
		ifFalse: [ 
			value := [ configuration perform: request asSymbol ]
							on: Error
							do: [ self exitFailure: 'The argument of introspect: ' , request , ' does not exist or raise an error.' ].
			(value isKindOf: FileReference)
				ifTrue: [ value := value fullName ] ]
		ifTrue: [ request = 'chapters'
				ifTrue: [ | files string |
					files := configuration  propertyAt: 'chapters' ifAbsent: [nil].
					string := ''.
					files ifNotNil: [   
						files
							do: [ :each | string := string , each ]
							separatedBy: [ string := string , ' ' ]].
					value := string ] ].
	self stdout
		nextPutAll: value asString;
		lf.
	self exitSuccess