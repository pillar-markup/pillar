test file creation
pillarContentsForTest

	^ 
'!A Pillar document test
!!Some tests that should pass

A first testable test
[[[testcase
3 + 7
>>>10
]]]

A second test without testable this time 
[[[
3+8
>>>11
]]]

A third test with testable
[[[testcase
3 + 4
>>>7
]]]

!!Some tests that should fail

A first testable test
[[[testcase  
3 + 4
>>>10
]]]

A second test without testable this time
[[[
3 + 5
>>> 11
]]]

A third testable test
[[[testcase
4 + 5
>>>12
]]]

!!Tests that should raise an exception

A first testable test
[[[testcase
3 + ''12''
>>>10			
]]]

A second test without testable
[[[
3 - ''14''
>>>10
]]]

A third testable test
[[[testcase
''1'' + 2
>>>14
]]]
'