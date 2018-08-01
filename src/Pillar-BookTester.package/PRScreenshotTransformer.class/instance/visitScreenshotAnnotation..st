accessing
visitScreenshotAnnotation: aPRShowMethodAnnotation
	
	"Todo: Redefine export so that the .png goes into the folder /figures"
	| className methodName packageName  browser fileName figure |
	className := self class environment at: (aPRShowMethodAnnotation className asSymbol).
	methodName := className methodDict at: (aPRShowMethodAnnotation methodName asSymbol).
	packageName := aPRShowMethodAnnotation packageName asPackage.
	"Creation of the browser and exportation of the figure"
	browser := ClyFullBrowser new.
	browser navigationEnvironment: (ClyNavigationEnvironment overSystemEnvironment: ClySystemEnvironment currentImage).
	browser methodGroupQuery: (ClyAllMethodGroups sortedFrom: (browser metaLevelScope emptyIn: browser navigationEnvironment)).
	browser selectPackage: packageName.
	browser selectClass: className.
	browser selectMethod: methodName.
	fileName := browser exportAsPNGSilentlyForPillarWithClass: aPRShowMethodAnnotation className andMethod: aPRShowMethodAnnotation methodName. 
	"We want the names and not the objects in order to to generate the png file name"
	"Transformation of the annotation into a PRFigure NOTE: it wont work if you want to screenshot a method/class with a + in it"
	figure := PRPillarParser new parse:('+' , aPRShowMethodAnnotation caption, '.>file://figures/screenshots', fileName,
								'|width=', aPRShowMethodAnnotation width,
								'|label=', aPRShowMethodAnnotation label, '+').
	figure := (figure children first) children first.
	"returns aPRDocument (> children first >) aPRParagraph (>children first >) aPRFigure"
	self replace: {figure}