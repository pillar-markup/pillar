accessing
writerFor: aPRPillarConfiguration 
	
	^ (PRDocumentWriter allSubclasses detect: [ :each | 
		each isAbstract not
			and: [ each writerName = aPRPillarConfiguration htmlWriter ] ])
				new