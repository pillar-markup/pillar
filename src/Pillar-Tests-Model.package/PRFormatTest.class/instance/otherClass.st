accessing
otherClass
	^ otherClass ifNil: [ otherClass := PRFormat allSubclasses detect: [ :each | self actualClass ~= each ] ]