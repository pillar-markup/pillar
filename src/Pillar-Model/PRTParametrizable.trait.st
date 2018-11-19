"
I'm a trait that proposes parameter-related methods.
"
Trait {
	#name : #PRTParametrizable,
	#category : 'Pillar-Model-BasicRoots'
}

{ #category : #'accessing-parameters' }
PRTParametrizable >> hasParameter: aKey [
	self
		parameters at: aKey
		ifAbsent: [ ^ false ].
	^ true
]

{ #category : #'accessing-parameters' }
PRTParametrizable >> hasParameters [
	^ self parameters isEmpty not
]

{ #category : #'accessing-parameters' }
PRTParametrizable >> parameterAt: aKey put: aValue [
	^ self parameters at: aKey put: aValue
]

{ #category : #'accessing-parameters' }
PRTParametrizable >> parameters [
	^ self explicitRequirement
]
