conversion
convertNewLine: aValue
	"generated code"
	^ (Dictionary
			newFrom:
				{(#cr -> String cr).
				(#lf -> UnixPlatform new lineEnding).
				(#crlf -> Win32Platform new lineEnding).
				(#unix -> UnixPlatform new lineEnding).
				(#mac -> UnixPlatform new lineEnding).
				(#dos -> Win32Platform new lineEnding)}) at: aValue