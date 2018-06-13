as yet unclassified
createDocList: aPRDocListAnnotation

	| files document |

	document := PRDocumentGroup new.
	
	files := (workingDirectory resolve: aPRDocListAnnotation directory) children.

	1 to: aPRDocListAnnotation limit asInteger do: [ :index |
			document add: (self parseFile: (files at: index))].
	
	1 halt.

	^ PRDocList new
				directory: aPRDocListAnnotation directory;
				limit: aPRDocListAnnotation limit;
				sort: aPRDocListAnnotation sort
			