"
I'm a notebook Presenter use by the previewer system 
"
Class {
	#name : #FDNoteBookPreviewerPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook',
		'page'
	],
	#classVars : [
		'IconCache'
	],
	#category : #'FileDialog-UI'
}

{ #category : #specs }
FDNoteBookPreviewerPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal	 
		add: #notebook;
		yourself
]

{ #category : #'private - icons' }
FDNoteBookPreviewerPresenter class >> driveIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4je2RPUoDcRDFf7tI
mjSbE5gUYhoFjSvYSI5i4QFSWHgYIQewELyFX4mF4BfqqmhlSJotdve/8yySbEwhrq34YJjH
K2bem4F//AF4U/IYvdYl9c0UmAwzw0zIZvyL3thsrUYA/myU1wWCkou7U+IDRC9vHQ/av3De
Pjm/3Cki9K9uh3c314GZTWwKyZCETOOOkAAEgqXl5mh7a6O2ADAYfATHR4ckSUKapkVlWYZz
DucceZ4Tr8VUTitIorO3H8zf4Af4LZ/wICQO43m97AC7MHq7Papn1TndA7h/fh9GTw9B8TZZ
kd007kzugEASi/XGaH2lWStr4Ft8AlWZooQwDP14AAAAAElFTkSuQmCC'
]

{ #category : #'private - icons' }
FDNoteBookPreviewerPresenter class >> fileIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACjElEQVR42o2SW0hUURSG/32O
hnhAqJDCzF6kN0lLGtJCtLQyKIMotRjBy1sqVEZS9mKZBdKFHBJpJEKD0urBvAchhqY5kp6M
HkRlMhpHR2fOHuZybu3KxhEr+/fL3g/rWx9rL4Kl1La+ta0XwiNUTVf9sgJF0yB5FVCfAqt9
Lnx8yt7Ph4Qc6btVtIigkN+XJ28s9MTeHQLPETipF3aXB7NOJ2wLXnyamYVlwgq/jN5Fj+9Q
X3WhZxXg8ethmpMSzwA666rDxSBOKsHhViBa7XC5ndgWuRH1PSP9XlnJZJDFFYBHXe/p6bQE
IanoGTZECJDhh98jg6gc5ue+oqwkBXlp8TB3WfBiYLx3yuYwiqbS6QDA3DVEjWk7BZ7n8Kc0
9IzAEBsFm+RG6+BndFsmhsdMxYkBwIO2d7QwI1HIrmgH0XmEMo7MA5qiQ9PZQF0SrDNOpBq2
YPPWcLT0i+KYqTQuALjzvJeePZr8V4Nf0fHF4cD49DzKHnaKo7Uly4Cqpg568WS6kH21GxpR
EIZQEKKxEo4ZaXDJfrgWJBwwxGBPfDTONbxigOJlQLm5jVYaD65hAHgUP77ZKY5fbxI/BAPO
m9vpTWOGkH2lExzHIKwrYYcnPNQwnhnpkKjGukciddcm5N9tFkdNJasBaxnouo5J2wKOVTaK
YjDggrmDVhvThVOX2S9wPOu8tGnk5+zAMRPqk7HfEI2kuEjk32tmvxAEKK1rpTUFh9c00JjB
FDPIYgYrAAW3W2hdcZaQU9GGdWwJOMIFCnRNxY+X5FaxLyEK6ckxOFPzdCUg90YjbbyUK+A/
Mk89yCyvFwfvBy1SbF6VLWF7TIRPUdV/FRNNh6qowsDHyaG5l9d2fwfyXD4gAGnljAAAAABJ
RU5ErkJggg=='
]

{ #category : #'private - icons' }
FDNoteBookPreviewerPresenter class >> folderIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABdElEQVR42mNkoBAwwhhdbT7Z
xvqa4b9/fmT+++sT45vXz3+XNB3qfP36/3ag9H+8BvT1xCdkJljN5WD4z8TwGyjwC6gDiDfs
OfgpumhF/Pfv/zfiMoQxNibQua0lfPvv729Z///+w/Dvzx8Gpn8MDOysrAyM//4z7D1x9dOr
D99WiYvyfv737zfDv79ANUD6z68fDMvXn9rIuGBBZ018NH8zw1+gcUCNcJogm5EhrnbyZMZ5
81prEqOFm4nXCGMzMsTWTpjMOHdOU01StFgzabZDXBBT2zeZcc6suprkGKlmkImkGhJd1z2Z
cdaM6prUGNlmkImkhkNUXcdkxpnTymvSYhSbMRQR4YXIurbJjNOnFtdkxKhiD0QCsRBR3zyZ
cdrkgprMGI1m0myHxEJ4fcNkxikTc2qyY3TJ8AIDQ1h97WRGaysdM011qeh///8w/v8HSmV/
GP7/+8sA5DOg8EH0fxD/L1z87OW3W+GZieLcSC4AAOV6G9lUA/2gAAAAAElFTkSuQmCC'
]

{ #category : #accessing }
FDNoteBookPreviewerPresenter class >> iconCache [

	^ IconCache 
]

{ #category : #accessing }
FDNoteBookPreviewerPresenter class >> iconNamed: aSymbol [
	"Returns the icon with the given name"
	
	| selector |
	selector := (aSymbol , 'Contents') asSymbol.
	(self class canUnderstand: selector) ifFalse: [ ^super iconNamed: aSymbol ].
	^ self iconCache
		at: aSymbol
		ifAbsentPut: [ 
			Form
				fromBinaryStream: (self perform: selector) base64Decoded readStream ]
]

{ #category : #specs }
FDNoteBookPreviewerPresenter class >> open [
	<script>
	^ self new openWithSpec; yourself 
]

{ #category : #'private - icons' }
FDNoteBookPreviewerPresenter class >> terminalIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHklEQVR4XmOgGIiKimlo6+iF
koqVlVVcgdoZGYpKKladv3z9PxxfAuFr/8+h44vX/m/bc+T/1t2H/x84evr/yvXb/gMN4Gco
Kata5e/v/9/X1/e/t7f3f09Pz/9ubm7/nZ2d/zs4OPy3sbH5b25u/t/Q0PC/qqrqf1FR0f+M
jIz/C0sqQAYIww2YM2fO//j4+P+xsbH/16xZQ7wBxVgMiIqK+j9t2rT/WVlZ/2tra8HiSkpK
/yUlJf/z8/OjGpBTUAr3gpeX139TU9P/MjIy/7m4uEAKcOKsvGKYASVgA0xMTP5zc3Pj1YTT
AAUFBaI1YhgAZKwiVfNwM0BFVS3B1z94OxDvIAWbWVgtBBrAywDOEAwMLEDMSiJmYaAGAABP
FCjDKXmnHQAAAABJRU5ErkJggg=='
]

{ #category : #initialization }
FDNoteBookPreviewerPresenter >> initializePage [
	^ SpNotebookPage
		title: 'Previewer '  
		icon: (self iconNamed:#page )
		provider: [ page ]
		 
]

{ #category : #initialization }
FDNoteBookPreviewerPresenter >> initializeWidgets [
	notebook := self newNotebook.
	page := self newText.
	notebook addPage: self initializePage
]

{ #category : #accessing }
FDNoteBookPreviewerPresenter >> page [
	^ page
]

{ #category : #adding }
FDNoteBookPreviewerPresenter >> page: aPresenter [
	page := aPresenter.
	notebook removePageAt: 1.
	notebook
		addPage: self initializePage;
		selectPageIndex: 1
]

{ #category : #initialization }
FDNoteBookPreviewerPresenter >> setNotebookPage: aNotebookPage [
	notebook addPage: aNotebookPage
]
