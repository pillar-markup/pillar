visiting
start: aDocument
	currentSlide := 0 + self configuration slideInTemplateForDeckJS.
	anchorMapping := Dictionary new.
	super start: aDocument.
	^ anchorMapping