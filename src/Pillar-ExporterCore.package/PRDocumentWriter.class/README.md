I'm the superclass of all classes supposed to output a pillar document to a text file. I have a canvas to which the subclasses can write to using dedicated brushes. I have a configuration which specifies some details about how to write text (e.g., end of line convention).

I can either emit the raw text or converted text. By default I convert text. 