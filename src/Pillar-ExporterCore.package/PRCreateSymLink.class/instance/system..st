system
system: command
	"Perform OS system() call."
	^ self ffiCall: #(#int #system #(#char #* #command)) module: LibC