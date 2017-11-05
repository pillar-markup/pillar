actions
actionOn: anInput
	anInput input children
		do: [ :documentItem | self manageItem: documentItem ].
	self possibleTransformationEnding.
	anInput input setChildren: newChildren asArray.
	^ anInput