actions
actionOn: anInput
	self exportInput: anInput.
	self createSymbolicLink.
	^ anInput