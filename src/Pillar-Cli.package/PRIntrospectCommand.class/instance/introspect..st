actions
introspect: aValue
	"specialAccess are requests that are not directly handled by executing a message on the configuration."
	"evil hack for now before we get a real query. may be a block"

	| specialAccess result |
	specialAccess := #('chapters').
	(specialAccess includes: aValue)
		ifTrue: [ aValue = 'chapters'
				ifTrue: [ | files string |
					files := self configuration propertyAt: 'chapters' ifAbsent: [ nil ].
					string := ''.
					files ifNotNil: [ files do: [ :each | string := string , each ] separatedBy: [ string := string , ' ' ] ].
					^ string ] ].

	result := self configuration perform: aValue asSymbol.
	^ ((result isKindOf: FileReference)
		ifTrue: [ result fullName ]
		ifFalse: [ result ]) asString