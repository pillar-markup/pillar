grammar - List
termListItem
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^ termMarkup and , termBasicListItem optional , ((commentedLine , newline) ==> [ :array | array first ]) star , termSubListItem optional