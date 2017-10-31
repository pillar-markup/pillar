private
escape: aString all: anArray
	^ anArray
		inject: (self escape: aString using: '\')
		into: [ :result :each | self escape: result using: each ]