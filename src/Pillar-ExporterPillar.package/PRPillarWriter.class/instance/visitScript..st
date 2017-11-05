visiting-document
visitScript: aScript
	canvas raw: (self markupFor: aScript).
	self visitParametersOf: aScript.
	canvas
		newLine;
		nextPutAllLines: aScript text;
		newLine;
		raw: (self markupEndFor: aScript)