accessing
visitScreenshotAnnotation: aPRShowMethodAnnotation
	
	"Todo: Redefine export so that the .png goes into the folder /figures"
	| className methodName packageName  browser fileName figure |
	className := self class environment at: (aPRShowMethodAnnotation className asSymbol).
	methodName := className methodDict at: (aPRShowMethodAnnotation method asSymbol).
	packageName := aPRShowMethodAnnotation package asPackage.
	"Creation of the browser and exportation of the figure"
	browser := ClyFullBrowser new.
	browser navigationEnvironment: (ClyNavigationEnvironment overSystemEnvironment: ClySystemEnvironment currentImage).
	browser methodGroupQuery: (ClyAllMethodGroups sortedFrom: (browser metaLevelScope emptyIn: browser navigationEnvironment)).
	browser selectPackage: packageName asPackage.
	browser selectClass: className.
	browser selectMethod: methodName.
	fileName := browser exportAsPNGForPillar.
	"Transformation of the annotation into a PRFigure"
	figure := PRPillarParser new parse:('+' , aPRShowMethodAnnotation caption, '.>file://figures/', fileName,
								'width=', aPRShowMethodAnnotation width,
								'label=', aPRShowMethodAnnotation label, '+').
	figure := (figure children first) children first.
	"returns aPRDocument (> children first >) aPRParagraph (>children first >) aPRFigure"
	self replace: {figure}