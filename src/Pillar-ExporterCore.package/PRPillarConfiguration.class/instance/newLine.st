accessing
newLine
	"The string that separates lines in the exported document. This is often either LF or CR\+LF but any string is possible."
	^ newLine ifNil: [ newLine := Smalltalk os lineEnding ]
		