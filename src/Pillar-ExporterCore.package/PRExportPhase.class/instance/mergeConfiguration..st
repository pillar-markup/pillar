private
mergeConfiguration: aConfig
	| conf |
	aConfig parent
		ifNil: [ ^ aConfig ].
	conf := self mergeConfiguration: aConfig parent.
	conf metadata properties
		keysDo: [ :each | 
			aConfig metadata
				propertyAt: each
				ifAbsentPut: [ conf metadata propertyAt: each ] ].
	^ aConfig.