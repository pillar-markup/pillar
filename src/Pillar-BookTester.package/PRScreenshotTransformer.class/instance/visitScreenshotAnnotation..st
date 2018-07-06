accessing
visitScreenshotAnnotation: aPRShowMethodAnnotation
	
	"Todo: Redefine export so that the .png goes into the folder /figures"
	| className methodName packageName  browser fileName |
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
	"Transformation of the annotation into a figureReference"
	"We want to obtain the reference as follows: +Caption .>file://figures/figureTitle|width=50|label=someLabel"
	self replace: { '+' , aPRShowMethodAnnotation caption, '.>file://figures/', 
								'width=', aPRShowMethodAnnotation width,
								'label=', aPRShowMethodAnnotation label, '+' } "False, I need the object itself not the annotation"