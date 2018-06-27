as yet unclassified
at: aKey ifPresent: aPresentBlock ifAbsent: anAbsentBlock
	^ self children
		detect: [ :eachParameter | eachParameter key = aKey ] 
		ifFound: [ :aParameter | aPresentBlock cull: aParameter value ]
		ifNone: anAbsentBlock