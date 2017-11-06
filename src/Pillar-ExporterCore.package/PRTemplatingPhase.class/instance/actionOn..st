actions
actionOn: aPillarContext
	| writer content |
	writer := aPillarContext configuration outputType new.
	content := writer write: aPillarContext input.
	^ (MustacheTemplate on: (aPillarContext configuration baseDirectory / 'support' / 'templates' / 'main.latex.mustache') readStream contents)
		value:
			{('title' -> 'Grgrgrgr').
			('attribution' -> 'Super cool').
			('content' -> content)} asDictionary