grammar - List
unorderedListItem
	self flag: #todo.	"This and the overriden method of the parser are REALLY bad. We parse several times the same input, this is bad."
	^	epsilonToken , 
		unorderedMarkup and , 
		unorderedBasicListItem optional , 
		((commentedLine , newline) ==> [ :array | array first ]) star , 
		unorderedSubListItem optional ,
		epsilonToken