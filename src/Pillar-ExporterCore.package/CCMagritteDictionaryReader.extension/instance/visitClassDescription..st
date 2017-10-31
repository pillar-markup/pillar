*Pillar-ExporterCore
visitClassDescription: aClassDescription
	self
		tryToAddFrom: aClassDescription
		withInterpretation: [ :value | PRDocumentWriter allSubclasses detect: [ :klass | klass isAbstract not and: [ klass writerName asString = value ] ] ]