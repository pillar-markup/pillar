helpers
writeCounter: aCounter
	"Write on the canvas the string representation of ==aCounter=="

	^ aCounter elements do: [ :each | self writeCounterElement: each ] separatedBy: [ self writeCounterElementSeparator ]