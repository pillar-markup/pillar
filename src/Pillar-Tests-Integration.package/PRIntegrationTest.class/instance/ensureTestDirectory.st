initialization
ensureTestDirectory

	projectDirectory := '__test' asFileReference.
	projectDirectory ensureDeleteAll.
	projectDirectory ensureCreateDirectory.