visiting
start: aDocument
	anchorMapping := PRAssociateAnchorToSlideNumber new
		configuration: self configuration;
		start: aDocument.
	super start: aDocument