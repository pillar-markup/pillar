tests
createPillarFile2
	| pillarFile |
	pillarFile := 'input2.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!! TestFile21

There is also a template system, you can find template in the folder ''_support/template''.
Some template are already written, but if you want to have your own, you had two solutions:
-edit the existing template related to the format you want to change (recommanded)
-create your own template with its own name and change used template in the Makefile'
		 ]