accessing
writer
	
	^ (PRDocumentWriter allSubclasses detect: [ :each | 
		each isAbstract not
			and: [ each writerName = (project configuration propertyAt: #htmlWriter) ] ])
				new