Extension { #name : #Association }

{ #category : #'*Pillar-BookTester' }
Association >> isPaired [
	"
	7+3 >>> 10
	"
	
	^ self key = self value
]
