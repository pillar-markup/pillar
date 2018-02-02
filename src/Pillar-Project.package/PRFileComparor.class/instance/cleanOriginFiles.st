accessing
cleanOriginFiles
	"first we will reject some files that should not be considered during the check."
	
	originFiles := origin allFiles reject: [ :each | (each basename beginsWith: '.') or: [ each basename beginsWith: '_' ] ].