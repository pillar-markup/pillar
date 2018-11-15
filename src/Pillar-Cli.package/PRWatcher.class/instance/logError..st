private
logError: anError

	Smalltalk logStdErrorDuring: [ :stderr|
		"install the line end conversion and force initialize the converter"
		stderr
			nextPutAll: anError messageText; cr;
			"reset the color"
			nextPut: Character escape; nextPutAll: '[0m'.
		anError signalerContext shortDebugStackOn: stderr.].