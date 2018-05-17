initialization
setUp
	super setUp.
	builder := PRTocBuilderVisitor new.
	simpleDocument := PRPillarParser
		parse:
			'! test1
! test2'.
	inputDocument := PRPillarParser
		parse:
			'! test1
! test2

${inputFile:input1.pillar}$

${inputFile:input2.pillar}$
'.
	advancedDocument := PRPillarParser
		parse:
			'! test1
! test2

! test3

${inputFile:input2.pillar}$

! test4

${inputFile:input1.pillar}$

'.
	complexToc := PRPillarParser
		parse:
			'!! Test1
!!! Test11
!!!! Test111
!!! Test12
!!!!! Test121
!!!! Test122
!! Test2
! Test3'.
	self createPillarFile1.
	self createPillarFile2.
	self createPillarFile3.
	self createCyclicPillarFile1.