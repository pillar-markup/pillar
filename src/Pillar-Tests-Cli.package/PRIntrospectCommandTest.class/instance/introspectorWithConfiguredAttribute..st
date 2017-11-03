tests
introspectorWithConfiguredAttribute: anAttribute

	| command |
	command := PRIntrospectCommand new.
	command configuration: (self configurationWith: anAttribute).
	^ command