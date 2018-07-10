I am an annotation used to show a screenshot of a given class and method.

I am used in a PRDocument to include a PRPicture and add a PNG file to the /figures chapter subfolder.

My parameters are: 
- package: the targetted package
- class: the targetted class
- method: the targetted method
- width: PRFigure width (as would be used in a more classic figure inclusion with +caption .>file|width=50)
- label: PRFigure label (as would be used in a more classic figure inclusion with +caption .>file|label=aa)

I am used as follows in a document:

	${screenshot:package=Kernel|class=Integer|method=+|width=50|label=aa}$
	
Note:
	Contrary to the loader or run annotations, there is a transformation going on here: a PRFigure is created in the end, so there is a need here to use a PRNodeTransformer subclass, PRScreenshotTransformer.