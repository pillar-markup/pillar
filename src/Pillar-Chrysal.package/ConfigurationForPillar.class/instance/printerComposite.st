accessing
printerComposite
	"generated code"
	^ self propertyAt: #printerComposite ifAbsent: [ ChrysalCompositeDomain new ]