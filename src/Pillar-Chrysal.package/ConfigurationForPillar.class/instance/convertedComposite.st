accessing
convertedComposite
	"generated code"
	^ self propertyAt: #convertedComposite ifAbsent: [ ChrysalConvertedCompositeDomain new ]