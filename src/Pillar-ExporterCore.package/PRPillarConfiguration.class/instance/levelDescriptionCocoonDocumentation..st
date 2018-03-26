descriptions
levelDescriptionCocoonDocumentation: levelNumber
	|  level |
	level := levelNumber asString.
	^ 'Configure how headers at level ', level, ' will be rendered. Value must be a dictionnary. These keys are recognized:
;==numbering==
:a boolean indicating if headers at this level must be numbered
;==size==
:a positive number indicating how many parent levels should be visible in the number: e.g., if ==2==, the parent header''s number and the current header''s number will be shown (must be lower than or equal to ', level,')
;==renderAs==
:a string indicating how the numbering is done (must be one of =="number"==, =="roman"==, =="letter"== or =="upperLetter"==)'