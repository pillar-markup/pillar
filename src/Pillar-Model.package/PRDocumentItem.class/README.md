I am an abstract superclass for the document hierarchy. My subclasses include all the basic elements to represent a document.

Description
----------------------------

Most of the time I will be use by a visitor that will visit me. Each of my subclasses can have his own visitor.
I usually am contain inside a PRDocumentGroup at the exception of PRDocument.

Public API and Key Messages
----------------------------

- #parser
    This class method return the default parser for this document model.

Example
----------------------------

I am an abstract class. I should not be use directly.

Internal Representation and Key Implementation Points.
----------------------------

    Instance Variables
	counter:		I am a counter use by some document items. Maybe I can be improve because not all items need a counter.
