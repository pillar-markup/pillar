## Microdown tools: Checkers

Microdown proposes several tools to help document writers. In this chapter, we present the one related to
book validation and the available checkers. 

Three kinds exist
- Reference. The checker checks for anchors and references. 
- Code validation. The checker checks whether code snippets are correctly executed.
- Version validation. The checker checks whether the code snippet is the same as in Pharo.

Note that other tools are under development such as the help to hide method body automatically so that writers can write manuals where readers should provide answers.

### References

Microdown via the Pillar compilation chain offers the possibility to report:

- Duplicated anchors. 
- References to unexisting anchors
- Unreferenced figures
- Missing figure files
- Missing input files

Note that such verification takes into account section, figure, and equation anchors.

Here is an extract of a report produced by the checker. 

```
pillar referenceCheck index.md
```

```
File index.md has reference problems.

## Undefined input files:

	Undefined file input: booklet-PharoVirtualMachine/Part2-JIT/CallingConventions/CallingConventions.md (in file /Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks2/Booklet-PharoVirtualMachine/index.md) refer to file that does not exist.


## Duplicated Anchors:

	Anchor sec:references is duplicated in file: Booklet-PharoVirtualMachine/Part0-Preamble/1-ObjectStructure/objectStructure.md
	Anchor sec:references is duplicated in file: PharoBooks2/Booklet-PharoVirtualMachine/Part0-Preamble/1-ObjectStructure/objectStructure.md


## Undefined Anchors:

	Anchor Ephemerons is undefined in file: /Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks2/Booklet-PharoVirtualMachine/Part3-MemoryManagement/GarbageCollector/ephemerons.md
	...

## Unreferenced Figures

	Figure 'figures/interpreter_variables.pdf' with anchor 'interpreterVariables' (in file /Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks2/Booklet-PharoVirtualMachine/Part1-InterpreterAndBytecode/4-Interpreter/theInterpreter.md) is not referenced.
	...
```

### Code snippet validation

Microdown supports the automatic validation of code snippets.
The following snippets illustrate the points. 

Here the writer wants to make sure that the expression 3 + 4 returns the correct result 7. He tags the code and use the `>>>` on a separate line. 

```
    ```example=true
	3 + 4 
	>>> 7
	```
```

He can also declare that a given expression is expected to cause a failure using the `expectedFailure` tag as follows.


```
	```example=true&expectedFailure=true
	3 + 4 
	>>> 12		
	```	
```

### Version drift detection

As an author, you may copy and paste a method definition from a Pharo class to your book.
Then the natural question that arises is whether that copy is still valid in a more recent version of the system. 

Imagine that in class `A` you define the method `simpleCode`.

```
A>>simpleCode
	"The comment of simpleCode"
	
	^ 100 slowFactorial
```

Imagine that you want to have this method definition in your document and that you want the checker to report if the method changes. You can do it using the `sync` key.

```
	```sync=true&origin=MicMethodBodySyncTest>>#simpleCode
	simpleCode
		"The comment of simpleCode"
	
		^ 100 slowFactorial
	```
```

### An architecture to plug extra analyses.

Code blocks are often used to define extensions. The `MicCodeBlockValidator` defines a way to modularly define new analyses. To declare a new analysis is easy:

- You have to define a new class subclass of `MicBookTesterStrategy`
- This class should define a method `verify:` expecting a code block. 
- Define a class method named `handleKey` that returns the key of the extension (`#sync` in the previous example). 


### Conclusion

Microdown is more than a Markdown language. In addition, to be extensible and having nice features such as references or anchors,  it is a symbiotic markdown for Pharo. It gives authors of Pharo books a clear advantage with powerful extensions and tools that make them more efficient. 
	



	
	