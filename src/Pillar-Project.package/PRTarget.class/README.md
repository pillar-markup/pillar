I am an abstract class representing a build target. I can contribute to the build pipeline by adding new build steps and I can also contribute to the preparation of the execution.

My subclasses represent different kind of build targets such as outputting files or run tests.

See PRProject, PRBuildGoal and PRPipelineBuilder.

