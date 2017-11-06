comparing
<= anObject
	"a LPPipe is <= than another if the second one depends on it. It means that the second is dependent on the first one."
	^ self allDependencies size <= anObject allDependencies size