*pillar-exportercore
pillarWriteDuring: aBlock
	self parent ensureCreateDirectory.
	self
		ensureDelete;
		writeStreamDo: aBlock