accessing
visitScreenshotAnnotation: aPRShowMethodAnnotation
	
	"Todo: Redefine export so that the .png goes into the folder /figures"
	| className methodName browser fileName figure time |
	className := self class environment at: (aPRShowMethodAnnotation className asSymbol).
	methodName := aPRShowMethodAnnotation methodName asSymbol.
	"naming the file as follows: className>>methodName-date.png"
	time := (((DateAndTime now asString copyReplaceAll: ':' with: '-') copyReplaceAll: '.' with: '-') splitOn: '+') first.
	fileName := (aPRShowMethodAnnotation className, '>>',aPRShowMethodAnnotation methodName),'-', time,'.png'.
	browser := ClyFullBrowser openOnMethod: className>>methodName.
	[1 seconds wait.
	browser window exportAsPNGSilentlyForPillarFileNamed: fileName] fork.
	browser close. 
	figure := PRPillarParser new parse:('+' , aPRShowMethodAnnotation caption, '.>file://figures/screenshots/', fileName,
								'|width=', aPRShowMethodAnnotation width,
								'|label=', aPRShowMethodAnnotation label, '+').
	figure := (figure children first) children first.
	"returns aPRDocument (> children first >) aPRParagraph (>children first >) aPRFigure"
	self replace: {figure}