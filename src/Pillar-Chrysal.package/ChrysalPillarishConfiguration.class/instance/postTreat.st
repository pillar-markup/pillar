post hooks
postTreat

	(self propertyAt: #levels ifAbsent: [^ self ]) do: [ 
			:levelSpec |
			| instance |
			instance := (self printer printerSpecFor: levelSpec renderAs).
			instance fillFromAnother: levelSpec. 
			self printer level: instance n: levelSpec level. 
			 ]