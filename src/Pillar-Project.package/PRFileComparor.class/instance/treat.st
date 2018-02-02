accessing
treat
	self cleanOriginFiles.
	originFiles do: [:aFile | 
		self treatFile: aFile ].
	