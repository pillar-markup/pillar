grammar - Document
document
	"A document contain everything that can be at the top of a document. It can contain for example some headers, paragraph, tables etc."

	^ (elementsAtLineBeginning / paragraph) star