accessing
filesToBuildOn: aProject

	^ files collect: [ :each | aProject baseDirectory resolve: each ]