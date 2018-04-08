accessing
defaultScriptLanguage
	"generated code"
	^ self propertyAt: #defaultScriptLanguage ifAbsent: [(PRRealScriptLanguage for: nil)]