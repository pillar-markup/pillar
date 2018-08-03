visiting
label

	^ self parameters at: #label ifAbsent: [ 'lab_', self methodName ]