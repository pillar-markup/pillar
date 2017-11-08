I am an annotation that mark the beginning of a new column. My tag is: 'column'.
[[[	
		${column:50}$
		${column:width=50}$
]]]

I can have as parameter:
- a width with the key "width=" (required, you can write it without the key, take an integer between 0 and 100)

!! Examples: 

Here is an example as used in Slides

[[[

${slide:title=First Exercise!}$

${columns}$

${column:width=50}$

- Watch the ""original"" Karate Kid first movie
- Be geeky
- Think about the exercises...

${column:width=50}$

+>file://figures/KarateKid.png|width=86+

${endColumns}$

]]]