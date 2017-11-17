running
tearDown

	"Run a GC to force files to be gc'd and thus closed in windows.
	Otherwise, open files remain open and the directory removal fails in the CI."
	Smalltalk garbageCollect.
	projectDirectory ensureDeleteAll.
	super tearDown.