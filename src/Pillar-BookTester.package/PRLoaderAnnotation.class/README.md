I am an annotation used to load a github project in a given state.

I am used in a PRDocument in order to load a github project at a given tag.

My parameters are: 
- account : github account name
- project : github project name
- tag : github commit tag 

I am used as follows in a document:

	${loader:account=QDucasse|project=TestBook|tag=Chapter1}$
	
Note:
	The visit of this annotation is performed by the PRBookTesterVisitor in charge of visiting the document and therefore there is not a PRLoaderAnnotationTransformer defined for a simple reason, this annotation does not transform anything.