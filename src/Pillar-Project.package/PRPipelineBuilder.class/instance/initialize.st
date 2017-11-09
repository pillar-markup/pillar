initialization
initialize
	super initialize.
	preParsingTransformations := Set new.
	pillarDocumentTransformations := Set new.
	postFormattingTransformations := Set new.
	postSaveTransformations := Set new.
	save := false.