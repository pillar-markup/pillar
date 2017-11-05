visiting-document
visitLink: aLink
	canvas raw: (PRPillarParser markups at: PRLink).
	super visitLink: aLink.
	canvas raw: (PRPillarParser markups at: PRLink)