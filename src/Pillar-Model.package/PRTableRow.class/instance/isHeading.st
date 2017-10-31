testing
isHeading
	"For a row to be considered a heading row, all cells must be either heading or empty. A totally empty row is not considered a heading row."

	^ (self children anySatisfy: [ :cell | cell hasChildren ])
		and: [ self children allSatisfy: [ :cell | cell isHeading or: [ cell hasChildren not ] ] ]