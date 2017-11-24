initialization
initialize
	super initialize.
	pillarDocumentTransformations := Set new.
	postFormattingTransformations := Set new.
	postSaveTransformations := Set new.
	save := false.