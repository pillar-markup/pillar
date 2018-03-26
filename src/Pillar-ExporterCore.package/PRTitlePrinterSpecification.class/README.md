I describe how a level should be printed. 

- My level is the level of the header I describe.

- Numbering is a boolean.
	 If numbering is false, the numerator will not take this level of header into account.
	If size is at 0, i'll take this level of header into account for the numerator but i'll not render the counter. If my size is at 1 i'll only render the numer of my header level. If my size x i'll render the counter of my level and the counter of x-1 of my parents.

- renderAs represents the kind of representation I want for my counter. It can be "number", "roman", "letter" or "upperLetter".

If numbering is at false, the size need to be 0.