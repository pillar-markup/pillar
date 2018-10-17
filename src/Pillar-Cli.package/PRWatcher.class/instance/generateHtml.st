as yet unclassified
generateHtml

	[ project build: PRHtmlOutput new ]
		on: Error do: [ : error | self logError: error ]