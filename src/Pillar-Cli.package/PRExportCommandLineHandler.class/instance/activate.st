activation
activate

	configurationInstaller := PRExportCommand new.
	super activate.
	configurationInstaller doIt.
	self exitSuccess