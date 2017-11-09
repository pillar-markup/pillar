I am a parameterizable test case. My tests can receive arguments.

>> testX: x y: y
  ...

Parameters are automatically deduced from argument names. That is, for argument #x, I search all selectors on the instance side that are prefixed by the string 'x'. For example,  on a parameter named #output I'll search all methods named  #output[Other] in the current hierarchy.

Once deduced the argument selectors from the argument names, I create a test case instance for each of the permutations of selectors.

My instances contain then:
 - the test selector to execute
 - an array with a permutation of selctors corresponding each to each argument name

My #performTest method is defined  to obtain all test arguments using the argument selectors and then perform the test selector providing those arguments.

I am not used so far because I don't work in SmalltalkCI