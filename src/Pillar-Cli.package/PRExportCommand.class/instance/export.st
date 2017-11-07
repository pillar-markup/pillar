parsing
export
	configuration defaultExporters do: [ :exporter | (configuration getConfigurationNamed: exporter) export ]