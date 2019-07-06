"
| t |
t := Text new 
	append: '0123';
	addAttribute: (TextColor new color: Color red) from: 1 to: 4;
	append: 'more';
	addAttribute: (TextFontReference toFont: 
(LogicalFont familyName: 'Source Sans Pro' pointSize: 18)) from: 5 to: 8.

t asMorph openInWorld

"
Class {
	#name : #PRTodo,
	#superclass : #Object,
	#category : #'Pillar-MorphicRenderer'
}
