activation
activate
	[ self command doIt ]
		on: CCConfigurationError , PRNoInputFileError
		do: [ :error | self exitFailure: error messageText ].
	self exitSuccess