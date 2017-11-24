I am a task in charge of building a stage of the pillar pipeline. I work as a command pattern, being my main method the #execute method.

 aTask execute.

Every task has two main properties: the modification time and its dependencies.

  aTask dependencies.
  aTask modificationTime.

Executing a task will only perform some work if the task needs to reexecute.

 aTask needsToReexecute.

A task needs to re execute if it is not already done, or if one of its dependencies changed.
Each concrete task determines whether it is already done or not. For example, a task can decide if it is done if a certain file is already written. A dependency is considered as changed if its modification time is older than the modification time of one of the dependencies. In other words,  this happens if one dependency changed and is more recent than the current task.

A task can be invalidated to make it lose its value and make #needsToReexecute to yield true in subsequent calls.

  aTask invalidate.

Moreover, A task execution can however be forced using the #doExecute

  aTask doExecute

!! Internal representation

Internally, a task has a result object. A result object has the result of the task and its latest modification time. The result object is initially a null object, instance of PRNoResult. Invalidating a task resets the result to a null object. Check the concrete subclasses of PRResult for more information.