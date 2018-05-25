testing
paragraphWithOtherMarkups
	<sampleInstance>
	
	^ PRPillarParser parse: 'Here is a list of publications
	
${publications:Ducasse|bibFile=rmod.bib}$
The paragraph continues here.
- a
- b
[[[
a test  
]]]
You can contact me if you want.'