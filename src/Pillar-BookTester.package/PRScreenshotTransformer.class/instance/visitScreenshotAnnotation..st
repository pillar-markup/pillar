accessing
visitScreenshotAnnotation: aPRShowMethodAnnotation
	
	| className methodName packageName  browser |
	className := self class environment at: (aPRShowMethodAnnotation class asSymbol).
	methodName := className methodDict at: (aPRShowMethodAnnotation method asSymbol).
	packageName := aPRShowMethodAnnotation package asPackage.
	"Creation of the browser and exportation of the figure"
	browser := ClyFullBrowser new.
	browser navigationEnvironment: (ClyNavigationEnvironment overSystemEnvironment: ClySystemEnvironment currentImage).
	browser methodGroupQuery: (ClyAllMethodGroups sortedFrom: (browser metaLevelScope emptyIn: browser navigationEnvironment)).
	browser selectPackage: packageName asPackage.
	browser selectClass: className.
	browser selectMethod: methodName.
	browser exportAsPNG.
	"Transformation of the annotation into a figureReference"
	"We want to obtain the reference as follows: +Caption .>file://figures/figureTitle|width=50|label=someLabel"
	self replace: { PRFigure }