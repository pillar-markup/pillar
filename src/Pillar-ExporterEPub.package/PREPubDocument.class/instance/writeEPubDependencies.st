writing
writeEPubDependencies

	project baseDirectory children do: [ :each |
		((each basename beginsWith: '_') or: [ each basename beginsWith: '.' ]) ifFalse: [ 
			each copyAllTo: self epubContentsGenerationDirectory / each basename ] ]