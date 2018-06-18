I am an abstract superclass for the document hierarchy. My subclasses include all the basic elements to represent a document.

!! Description

Most of the time I will be used by a visitor that will visit me. Each of my subclasses can have its own visitor.
I'm usually contained inside a PRDocumentGroup at the exception of PRDocument.

!! Public API and Key Messages

- #parser. This class method returns the default parser for this document model.


!! Internal Representation and Key Implementation Points.


-	counter:		I am a counter used by some document items. Maybe I can be improve because not all items need a counter.
