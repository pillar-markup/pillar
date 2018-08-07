grammar - List
dataListItem
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^	epsilonToken , 
		dataMarkup and , 
		dataBasicListItem optional , 
		((commentedLine , newline) ==> [ :array | array first ]) star , 
		dataSubListItem optional , 
		epsilonToken