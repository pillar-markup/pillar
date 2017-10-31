actions
actionOn: anInput
	^ anInput
		propertyAt: #anchorsMapping put: anchorsMapping;
		yourself