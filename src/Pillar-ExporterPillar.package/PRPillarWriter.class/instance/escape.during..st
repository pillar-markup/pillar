private
escape: aString during: aBlock
	"Protect ==aString== (additionally to already existing protected strings) by adding $\ while evaluating ==aBlock==."
	^ (markupsToEscape includes: aString)
		ifTrue: aBlock
		ifFalse: [ 
			markupsToEscape add: aString.
			aBlock ensure: [ markupsToEscape remove: aString ] ]