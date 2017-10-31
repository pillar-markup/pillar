tests - Table
testTableMarkupsHeadingAndCenter
	super testTableMarkupsHeadingAndCenter.
	self
		assert: result
		equals:
			{#center.
			true}