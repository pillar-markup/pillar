accessing
disabledPhases2: aCollection
	"Return the list of phases that Pillar should ignore. For example, a value with ==script, section, transform== will disable script evaluation (useful when security is important), sectioning (useful when generating HTML 4) and the transform phases (i.e. all the transformers)"
	
	disabledPhases := aCollection 