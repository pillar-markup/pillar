accessing
headerConfigurations
	^ HeaderConfigurations ifNil: [ HeaderConfigurations := self defaultHeaderConfigurations ]