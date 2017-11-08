visiting-document
visitOrderedList: aList
	"http://spec.commonmark.org/0.28/#list-items and http://spec.commonmark.org/0.28/#lists"

	canvas potentialNewLine.
	aList children
		withIndexDo: [ :each :i | self nest: i asString , '.' do: [ self visit: each ] ]