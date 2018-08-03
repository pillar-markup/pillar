accessing
visitScreenshotAnnotation: aPRShowMethodAnnotation
	
	| className methodName browser fileName figure time |
	className := self class environment at: (aPRShowMethodAnnotation className asSymbol).
	methodName := aPRShowMethodAnnotation methodName asSymbol.
	"naming the file as follows: className>>methodName-date.png"
	time := (((DateAndTime now asString copyReplaceAll: ':' with: '-') copyReplaceAll: '.' with: '-') splitOn: '+') first.
	fileName := (aPRShowMethodAnnotation className, '>>',aPRShowMethodAnnotation methodName),'-', time,'.png'.
	browser := ClyFullBrowser openOnMethod: className>>methodName.
	"this is needed in another process due to the way Calypso renders the text"
	[1 seconds wait.
	UIManager default defer: [browser window exportAsPNGSilentlyForPillarFileNamed: fileName]] fork.
	figure := PRPillarParser new parse:('+' , aPRShowMethodAnnotation caption, '.>file://figures/screenshots/', fileName,
								'|width=', aPRShowMethodAnnotation width,
								'|label=', aPRShowMethodAnnotation label, '+').
	figure := (figure children first) children first.
	"returns aPRDocument (> children first >) aPRParagraph (>children first >) aPRFigure"
	self replace: {figure}