grammar - Document
document
	"I build a PRDocument. I get a collection with all the children of the PRDocument and I dd them one by one."

	^ super document ==> [ :array | PRDocument withAll: array ]