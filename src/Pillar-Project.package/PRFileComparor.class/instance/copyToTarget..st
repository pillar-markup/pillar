accessing
copyToTarget: file

	(target / (file path relativeTo: origin path) pillarPrintString) ensureDelete.
	file copyTo: (target / (file path relativeTo: origin path) pillarPrintString)