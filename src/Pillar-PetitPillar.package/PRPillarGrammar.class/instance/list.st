grammar - List
list
	self flag: #todo.	"The list elements should be trim."
	^ (unorderedList / orderedList / definitionList) memoized