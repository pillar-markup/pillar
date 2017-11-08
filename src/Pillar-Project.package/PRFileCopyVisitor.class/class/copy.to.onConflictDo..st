copying
copy: srcReference to: dstReference onConflictDo: conflictResolutionBlock
	^ self basicNew
		initializeWithSource: srcReference 
		dest: dstReference;
		conflictResolutionBlock: conflictResolutionBlock;
		visit