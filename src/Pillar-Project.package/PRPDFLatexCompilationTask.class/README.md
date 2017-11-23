I am a file task that compiles a LaTeX file into a  pdf file. My result is the generated file.

For more information about Pillar tasks, read the comment on PRPillarTask.

My dependencies are:

 - inputFileDependency: the file to compile

Example of usage:

task := PRPDFLatexCompilationTask new.
task inputDocumentDependency: (PRGenericObjectTask resut: 'some/file/reference' asFileReference).
task execute.