activation
activate

	configurationInstaller := PRExportBuilder new.
	super activate.
	configurationInstaller doIt.
	self exitSuccess