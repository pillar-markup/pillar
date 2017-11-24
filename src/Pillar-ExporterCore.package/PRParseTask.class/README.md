I am a task that parses the contents of  a read stream and produces a pillar document from it.

For more information about Pillar tasks, read the comment on PRPillarTask.

My dependencies are:

 - inputStreamDependency: the read stream I'll parse

Example of usage:

task := PRPillarParseTask new
		inputStreamDependency: (PRGenericObjectTask
			result: aStream).