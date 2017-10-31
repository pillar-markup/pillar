parsing
export
	[ configuration defaultExporters
		do: [ :exporter | (configuration getConfigurationNamed: exporter) export ] ]
		on: CCConfigurationError , PRNoInputFileError
		do: [ :error | self exitFailure: error messageText ]