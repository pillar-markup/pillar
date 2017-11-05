action
sortDescriptions
	"I sort the descriptions to keep the order on the parameters for the Pillar exporter. If one day the Pillar export become a normalizer and not an exact expoter, just return ==class new magritteDescription children=="

	| sortedDescriptions descriptions |
	descriptions := class new magritteDescription children.
	sortedDescriptions := OrderedCollection new.
	dictionary keys
		do: [ :key | 
			descriptions copy
				do: [ :description | 
					description accessor readSelector = key
						ifTrue: [ 
							sortedDescriptions add: description.
							descriptions remove: description ] ] ].
	descriptions do: [ :each | sortedDescriptions add: each ].	"I add the rest of the descriptions to check if all required parameters are present."
	^ sortedDescriptions