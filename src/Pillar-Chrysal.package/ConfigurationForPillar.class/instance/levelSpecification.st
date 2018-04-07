accessing
levelSpecification
	"generated code"
	^ self propertyAt: #levelSpecification ifAbsent: [ PRTitlePrinterSpecification new ]