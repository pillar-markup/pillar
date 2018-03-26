visiting
start: aDocument
	currentSlide := self configuration slideInTemplateForDeckJS. "I do not understand what is this configuration property."
	anchorMapping := Dictionary new.
	super start: aDocument.
	^ anchorMapping