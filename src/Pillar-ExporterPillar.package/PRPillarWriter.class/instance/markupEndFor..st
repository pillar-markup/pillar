accessing
markupEndFor: aPRObject
	"Return the ending character for a given Pillar entity. Given a script (environment) returns ']]]'"
	^ PRPillarGrammar endMarkups at: aPRObject class