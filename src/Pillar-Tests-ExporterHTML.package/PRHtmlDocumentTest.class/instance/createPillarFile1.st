tests
createPillarFile1
	| pillarFile |
	pillarFile := 'input1.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!!! TestFile11

+Pillar logo>figures/pillar.png|width=30+

If you don''t know ''Pillar'', its documentation is *here>https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html*


!!! TestFile12

Hey you ...

!!! TestFile13

The book is generated directly in HTML and LaTeX with the command ==make book==



You can compile just one chapter with the command ==make book-result/chapterPathAndName.format==
For example, for the first chapter in LaTeX: ==make book-result/Chapters/Chapter1/chapter1.tex==


!!! TestFile14
What are you thinking about !!!??

!!! TestFile15
Where are you !!
'
		 ]