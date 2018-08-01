I am class representing a DocumentListAnnotation. 
I allow users to get abstracts of files located in a directory and specify a link to access these files.
I can choose the number of files to take and the way to sort them.
We can also choose they way abstracts will be represented by specifying templates. We ahave the possibility of giving multiple templates.
Then abstracts will alternately change templates if you specified mutliple directories.

When no template file is specified, abstracts are generated as DocumentGroup containing different files elements.
With templates the annotation is remplaced by a Raw document in Html.
For templates values, you can not specify directories, only .mustache files. You have to specify complete path starting from the project directory.
Also for the path, the complete path from the project directory.

${docList:path=blogs|limit=3|sort=date|templates=#('templates/docArticle.mustache' 'templates/template.mustache')}$

${docList:path=wrongDirectory|limit=3|sort=date|templates=#('templates/docArticle.mustache' 'templates/template.mustache')}$ should raise an Error