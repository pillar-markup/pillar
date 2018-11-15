*Pillar-Model
asMustachableValue
	"Return a string that represents the value of an object that mustache will inject in a template.
	For example true as MustachableValue should return 'true'
	"
	"true asMustachableValue >>> 'true'"
	"1 asMustachableValue >>> '1'"
	"'1' asMustachableValue >>> '1'"
	"(Path * 'foo.bib') asMustachableValue >>> 'foo.bib'"
	
	^ self asString