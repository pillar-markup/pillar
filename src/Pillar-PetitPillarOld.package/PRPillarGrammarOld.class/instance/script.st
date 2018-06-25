grammar - Script
script
	| endParser |
	endParser := newline asParser , (EndMarkups at: PRCodeblock) asParser , space star , lineEnd.
	^ (Markups at: PRCodeblock) asParser , scriptParameters , endParser negate plus flatten , endParser