I am a generic object task whose result is the result of executing a block or an already given object.

For more information about Pillar tasks, read the comment on PRPillarTask.

I have no dependencies

Example of usage:

task := PRGenericObjectTask result: someObject.
task execute.

task := PRGenericObjectTask doing: [  1 + 1 ].
task execute.