accessing
project

	^ project ifNil: [ project := PRProject on: self workingDirectory ]