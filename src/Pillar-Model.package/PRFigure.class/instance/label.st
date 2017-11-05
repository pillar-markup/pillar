accessing
label
	^ self parameters at: 'label' ifAbsent: [ nil ]