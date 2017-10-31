accessing-delegated
caption
	^ caption
		ifNil: [ 
			caption := self
				parameters at: 'caption'
				ifPresent: [ :string | (PRDocument parser parse: string) children first ]
				ifAbsent: [ PRParagraph with: (PRText content: '') ] ]