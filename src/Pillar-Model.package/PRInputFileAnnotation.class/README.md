I include a reference to a pillar file. With me we can add a transformation to remplace an annotation to a pillar file by his tree.

My tag is: 'inputFile''.

I can have in parameter:
- a path to a file with the key "value=" (required, you can write it without the key)

Examples: 

${inputFile:myFile.pillar}$

${inputFile:value=directory/myFile.pillar}$