visiting-annotations
visitStructure: aStructure
	| transformClass |
	transformClass := (self transformClassFor: aStructure tag) new.
	self replace: (OrderedCollection with: (transformClass  renderFor: aStructure))