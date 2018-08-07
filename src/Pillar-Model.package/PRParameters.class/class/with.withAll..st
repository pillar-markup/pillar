as yet unclassified
with: aPRParameter withAll: aCollection 
	| anInstance |
	anInstance := self new.
	aPRParameter ifNotNil: [ anInstance add: aPRParameter ].
	aCollection ifNotNil: [ anInstance addAll: aCollection ].
	^ anInstance