accessing
script
	"^ super script token"
	| endParser |
	endParser := newline asParser , (EndMarkups at: PRCodeblock) asParser token , space star , lineEnd ==> [:t | t second ].
	^ (Markups at: PRCodeblock) asParser token , scriptParameters , endParser negate plus token , endParser
	==> [ :t | 
		self commands add: (GTPillarCodeHighlightingCommand new
			start: t third start;
			stop: t third stop; 
			properties: t second;
			string: t third inputValue) ]