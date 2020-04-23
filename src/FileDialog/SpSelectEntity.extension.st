Extension { #name : #SpSelectEntity }

{ #category : #'*FileDialog' }
SpSelectEntity >> entitiesEntryCompletion [
	self flag: #WARNING.
	"it's ugly without this the chooseBlock"
	^ EntryCompletion new
				dataSourceBlock: [:currText | self possibleEntities collect: [:each | 
		each perform: self displaySymbol ]];
				"chooseBlock: [ :selectedName | 
					self entity: (self possibleEntities detect: [ :each | 
						(each perform: self displaySymbol) = selectedName ])];"
				filterBlock: [:currEntity :currText | 
					currEntity asUppercase includesSubstring: currText asString asUppercase].
]

{ #category : #'*FileDialog' }
SpSelectEntity class >> fDLayoutFileDialog [
	^ SpBoxLayout newVertical
		add: #entityText;
		yourself
]
