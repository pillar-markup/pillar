visiting-document
visitUnorderedList: aList
	"http://spec.commonmark.org/0.28/#list-items and http://spec.commonmark.org/0.28/#lists"
	canvas potentialNewLine.
	self nest: '-' do: [ self visitDocumentGroup: aList ]