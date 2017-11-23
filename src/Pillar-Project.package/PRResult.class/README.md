I am an abstract class representing the result of a task. I implement the following contract:
 - isDone: returns a boolean indicating if the result is valid or not
 - modificationTime: returns a DateAndTime with the last modification of the result
 - value: returns the current value.

See my subclasses for concrete examples.