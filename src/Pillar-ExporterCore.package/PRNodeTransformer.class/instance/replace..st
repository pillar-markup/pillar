protected
replace: newNodes
	"When we do a transformation I replace the current node by his transformation."

	replacement pop.
	replacement push: newNodes