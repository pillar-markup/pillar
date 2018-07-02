I am a tranformer in charge of transforming docList annotations. I just replace that annotation by  a document group containing an abstract of each file.

How To !!??
doc = PRDocument new.

((PRDocListTransformer withContext: (PRProject on: testingFileSystem)) start: doc).
