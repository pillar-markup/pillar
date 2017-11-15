instance creation
newReferenceFor: aReference
	
	^ aReference reference copyReplaceAll: '\' with: '/'