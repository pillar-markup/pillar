action
setFileAndInterval: aFileName
	"I get the File and i set the line numbers."

	fileStream := self configuration baseDirectory resolve: aFileName.
	fileStream exists
		ifTrue: [ 
			fileStream := fileStream contents readStream.
			self updateInterval ]
		ifFalse: [ PRInputFileError signal: aFileName , ' is not a valid file name into ' , self configuration baseDirectory asString , '.' ]