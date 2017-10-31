*Pillar-ExporterCore
visitPathOrStreamDescription: aPathOrStreamDescription
	self
		tryToAddFrom: aPathOrStreamDescription
		withInterpretation: [ :path | RelativePath from: path ]