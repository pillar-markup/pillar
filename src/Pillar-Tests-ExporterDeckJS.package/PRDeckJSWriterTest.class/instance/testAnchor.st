tests
testAnchor
	"Anchors define by the user in deck.js doesn't work so we don't need to render them."

	| item |
	item := PRAnchor new name: 'foo'.
	self deny: ((self write: item) includesSubstring: 'id="foo"')