grammar - Script
script
	| endParser |
	endParser := newline asParser , (EndMarkups at: PRScript) asParser , space star , lineEnd.
	^ (Markups at: PRScript) asParser , scriptParameters , endParser negate plus flatten , endParser