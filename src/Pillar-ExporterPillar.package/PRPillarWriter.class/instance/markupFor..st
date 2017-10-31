accessing
markupFor: aPRObject
	"Return the markup for a given pillar object. For example, given a pillar PRAnchor returns '@'"
	^ PRPillarGrammar markups at: aPRObject class