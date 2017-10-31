visiting-document
visitInFlowScript: aScript 
	canvas environment
		name: 'displaycode';
		parameter: (self languageForScript: aScript) sbaString;
		with: [
			self writeRawDuring: [ self visitText: aScript ].
			canvas newLine ]