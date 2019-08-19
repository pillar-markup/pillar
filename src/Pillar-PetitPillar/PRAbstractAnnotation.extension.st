Extension { #name : #PRAbstractAnnotation }

{ #category : #'*Pillar-PetitPillar' }
PRAbstractAnnotation class >> withParameters: aPRParameters [
	| parameters anInstance |
	anInstance := self with: aPRParameters.
	PRParserUtility fixFirstParameter: aPRParameters for: anInstance.
	parameters := aPRParameters asDictionary. 
	"parameters := PRParametersToOrderedDictionary of: aPRParameters."
	self validateParameters: aPRParameters dictionary: parameters in: anInstance.
	^ anInstance
		hadAllKeys:
			(self possibleParameters
				difference: (parameters keys collect: #asSymbol)) isEmpty;
		parameters: parameters;
		yourself
]
