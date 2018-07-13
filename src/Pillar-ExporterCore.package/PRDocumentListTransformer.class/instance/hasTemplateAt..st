testing
hasTemplateAt: aReference
	^ (self workingDirectory resolve: self defaultTemplateFile) exists 