adding
addScript: aScript
	| content cpt |
	content := String new writeStream.
	aScript hasNoCode
		ifFalse: [ 
			PRWarning
				signal:
					'Be careful, you used the fromFile parameter on a script which is not empty. This has been erased : ' , aScript text ].
	cpt := 0.	"We first pass the begining of the code."
	firstLine - 1 timesRepeat: [ fileStream nextLine ].
	lastLine - firstLine + 1
		timesRepeat: [ 
			content nextPutAll: fileStream nextLine.
			content nextPutAll: self configuration newLine ].
	^ aScript text: content contents