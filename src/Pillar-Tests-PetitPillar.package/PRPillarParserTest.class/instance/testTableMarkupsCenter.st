tests - Table
testTableMarkupsCenter
	super testTableMarkupsCenter.
	self
		assert: result
		equals:
			{#center.
			false}