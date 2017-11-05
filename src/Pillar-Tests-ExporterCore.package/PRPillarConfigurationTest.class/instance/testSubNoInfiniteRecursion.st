tests
testSubNoInfiniteRecursion
	 self configurationClass new subConfigurationNamed: self mockWriterClass writerName	"If this tests terminates, it passes :-). I tried to use #should:notTakeMoreThan: but it failed on Jenkins"