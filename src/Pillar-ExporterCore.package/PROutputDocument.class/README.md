I represent a pillar output document.

I contain the already written text (String) and the pillar document (ast) used to generate it. I'm useful in the post-processing steps of a pipeline, where a pipeline can choose to, for example:
- apply a template to the already written text (using the document's metadata)
- dump the text into a file