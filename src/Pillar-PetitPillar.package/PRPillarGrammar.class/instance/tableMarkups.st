grammar - Table
tableMarkups
	| optionalParser |
	self flag: #todo.	"In the future we will define the alignement before the headind."
	optionalParser := (tableAlignMarkup / tableHeadingMarkup) optional.
	^ (Markups at: PRTableCell) asParser , optionalParser , optionalParser