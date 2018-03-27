accessing
filesToBuildOn: aProject

	^ files collect: [ :file | 
				PRInputDocument new
					project: aProject;
					file: (aProject baseDirectory resolve: file);
					yourself ]