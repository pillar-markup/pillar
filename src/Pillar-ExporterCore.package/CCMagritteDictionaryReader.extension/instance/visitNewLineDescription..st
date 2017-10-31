*Pillar-ExporterCore
visitNewLineDescription: aNewLineDescription
	self
		tryToAddFrom: aNewLineDescription
		withInterpretation: [ :value | 
			value isSymbol
				ifTrue: [ 
					(Dictionary
						newFrom:
							{#cr -> String cr.
							#lf -> UnixPlatform new lineEnding.
							#crlf -> Win32Platform new lineEnding.
							#unix -> UnixPlatform new lineEnding.
							#mac -> UnixPlatform new lineEnding.
							#dos -> Win32Platform new lineEnding}) at: value ]
				ifFalse: [ value ] ]