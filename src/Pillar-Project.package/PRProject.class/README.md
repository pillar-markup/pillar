(PRCompilationPipeline buildPipe: PRPillarConfiguration new).

projectDirectory := '../test' asFileReference.
projectDirectory ensureDeleteAll.
projectDirectory ensureCreateDirectory.
project := PRProject on: projectDirectory.
project wipeout.
project archetype: 'welcome'.
project build: PRHtmlOutput new.

projectDirectory := '../test' asFileReference.
projectDirectory ensureDeleteAll.
projectDirectory ensureCreateDirectory.
project := PRProject on: projectDirectory.
project wipeout.
project archetype: 'presentation'.
project build: PRHtmlOutput new.
project build: PRPdfOutput new.

projectDirectory := '../test' asFileReference.
projectDirectory ensureDeleteAll.
projectDirectory ensureCreateDirectory.
project := PRProject on: projectDirectory.
project wipeout.
project archetype: 'book'.
project build: PRHtmlOutput new.
project build: PRPdfOutput new.

projectDirectory := '../test' asFileReference.
projectDirectory ensureDeleteAll.
projectDirectory ensureCreateDirectory.
project := PRProject on: projectDirectory.
project wipeout.
project archetype: 'basic-latex'.
project build: PRHtmlOutput new.
project build: PRPdfOutput new.