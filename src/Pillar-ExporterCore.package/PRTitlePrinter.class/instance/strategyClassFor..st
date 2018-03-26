accessing
strategyClassFor: aStyle
	
	^ self class strategyClassMapping at: aStyle ifAbsent: [ 'roman' ]