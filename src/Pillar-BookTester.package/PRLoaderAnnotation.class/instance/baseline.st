visiting
baseline

	"The baseline name may be different than the project name but we make it the same by default"
	^ self parameters at: #baseline ifAbsent: [ self project ]