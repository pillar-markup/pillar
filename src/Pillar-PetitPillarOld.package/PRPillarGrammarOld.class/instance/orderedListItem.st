grammar - List
orderedListItem
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ orderedMarkup and , orderedBasicListItem optional , ((commentedLine , newline) ==> [ :array | array first ]) star , orderedSubListItem optional