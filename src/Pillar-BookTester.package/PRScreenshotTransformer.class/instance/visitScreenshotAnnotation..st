accessing
visitScreenshotAnnotation: aPRShowMethodAnnotation
	
	| className methodName browser fileName figure time doc |
	className := self class environment at: (aPRShowMethodAnnotation className asSymbol).
	methodName := aPRShowMethodAnnotation methodName asSymbol.
	"naming the file as follows: className>>methodName-date.png"
	time := (((DateAndTime now asString copyReplaceAll: ':' with: '-') copyReplaceAll: '.' with: '-') splitOn: '+') first.
	fileName := (aPRShowMethodAnnotation className, '>>',aPRShowMethodAnnotation methodName),'-', time,'.png'.
	browser := ClyFullBrowser openOnMethod: className>>methodName.
	
	UIManager default defer: [browser window exportAsPNGSilentlyForPillarFileNamed: fileName.
									 browser close].
	
	doc := PRPillarParser new parse:('+' , aPRShowMethodAnnotation caption, '.>file://figures/screenshots/', fileName,
								'|width=', aPRShowMethodAnnotation width,
								'|label=', aPRShowMethodAnnotation label, '+').
	figure := (doc children first) children first.
	"returns aPRDocument (> children first >) aPRParagraph (>children first >) aPRFigure"
	self replace: {figure}