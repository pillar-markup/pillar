accessing
visitScreenshotAnnotation: aPRShowMethodAnnotation
	
	"Todo: Redefine export so that the .png goes into the folder /figures"
	| className methodName browser fileName figure |
	className := self class environment at: (aPRShowMethodAnnotation className asSymbol).
	methodName := className methodDict at: (aPRShowMethodAnnotation methodName asSymbol).
	"Creation of the browser and exportation of the figure"
	browser := ClyFullBrowser openOnMethod: className>>methodName.
	fileName := browser exportAsPNGSilentlyForPillarWithClass: aPRShowMethodAnnotation className andMethod: aPRShowMethodAnnotation methodName. 
	figure := PRPillarParser new parse:('+' , aPRShowMethodAnnotation caption, '.>file://figures/screenshots/', fileName,
								'|width=', aPRShowMethodAnnotation width,
								'|label=', aPRShowMethodAnnotation label, '+').
	figure := (figure children first) children first.
	"returns aPRDocument (> children first >) aPRParagraph (>children first >) aPRFigure"
	self replace: {figure}