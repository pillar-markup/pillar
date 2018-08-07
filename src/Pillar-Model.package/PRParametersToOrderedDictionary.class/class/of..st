actions
of: aPRParameters 
	<return: #OrderedDictionary>
	| anInstance |
	anInstance := self new.
	aPRParameters accept: anInstance.
	^ anInstance dictionary