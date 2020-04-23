"
I'm use by thez fileDialog

my job is to navigate across file 

I provide:
* an history of visited folder
* a textInput use to jump to the write path
* a dropList use to filter the content of the fileReferenceTable
* a TextPresenter to show the selectedFile 

CUSTOMIZATION
-------------

look at the protocol 'api-customization'

column: aCollectionOfColumn
===========================

	to use it you have to give a collection of son of FDAbstractFileReferenceColumn for more information on how to create see documentation of FDAbstractFileReferenceColumn

defaultFoler: aFileReference
============================

	nothing to say 

filtersCustomization: aCollectionOfFilter
=========================================

	more documentation see FDAbstractPredicate documentation

previewer: aPreviewer
=====================

	more documentation see FDAbstractPreviewer documentation
	
IV
--

currentPathTextInputPresenter : <SpTextInputFieldPresenter> It's use to display the current path and there are same feature like in window 
nameLabel : <SpLabelPresenter>
nameText: <SpTextInputFieldPresenter> , use to show the name of the selected item of fileReferenceTable
filtersDropList <SpDropList> , use to display all the filter
readPointerHistoryParcour <DoubleLink> , use for the navigationSystem
currentDirectory , <FileReference> into there is the currentDirectory 
hiddenFilter <FDAbstractPredicate> there is a NullFilter or an hiddenFilter
columns <FDAbstractFileReferenceColumn> it's a collection of Column use by FileReferenceTable
previewer <FDAbstractPreviewer> 
nextButton <SpButton> use for the navigationSystem 
previousButton <SpButton> use for the navigationSystem
notebookPreviewer <SpNoteBook> use by the preview system
fileReferenceTable <SpTablePresenter> it's display children of the current directory
"
Class {
	#name : #FDFileNavigationSystemPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'currentPathTextInputPresenter',
		'nameLabel',
		'nameText',
		'filtersDropList',
		'readPointerHistoryParcour',
		'currentDirectory',
		'hiddenFilter',
		'columns',
		'previewer',
		'nextButton',
		'previousButton',
		'notebookPreviewer',
		'fileReferenceTable'
	],
	#classVars : [
		'Columns',
		'Directory',
		'FilterSet',
		'LastDirectoryVisit',
		'Previewer'
	],
	#category : #'FileDialog-UI'
}

{ #category : #commands }
FDFileNavigationSystemPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [
	rootCommandGroup
		register:
			((CmCommandGroup named: 'interact with file') asSpecGroup
				register: (FDCreatDirectoryCommand forSpec context: presenter);
				register: (FDToggleHiddenFilesCommand forSpec context: presenter);
				register: (FDInspectCommand forSpec context: presenter);
				yourself)
]

{ #category : #defaults }
FDFileNavigationSystemPresenter class >> defaultColumns [
	^ {
	FDIconFileReferenceTableColumn  .
	FDbasenameFileReferenceColumn .
	FDSizeFileReferenceColumn .
	FDAccessRightFileReferenceColumn }
]

{ #category : #defaults }
FDFileNavigationSystemPresenter class >> defaultDirectory [
	^ FileLocator imageDirectory asFileReference
]

{ #category : #'class initialization' }
FDFileNavigationSystemPresenter class >> defaultFilterSet [
	^ FDAbstractFilter actions
]

{ #category : #defaults }
FDFileNavigationSystemPresenter class >> defaultPreviewer [
	^ FDNullPreviewer new
]

{ #category : #specs }
FDFileNavigationSystemPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #previousButton
					withConstraints: [ :contraint | contraint width: 30 ];
				add: #nextButton
					withConstraints: [ :contraint | contraint width: 30 ];
				add: #currentPathTextInputPresenter ;
				yourself)
			withConstraints: [ :contraint | contraint height: self toolbarHeight ];
		add:
			(SpPanedLayout newVertical
				add: #fileReferenceTable;
				add: #notebookPreviewer;
				yourself);
		add:
			(SpBoxLayout newHorizontal
				add: #nameLabel
					withConstraints: [ :contraint | contraint width: 35 ];
				add: #nameText;
				add: #filtersDropList
					withConstraints: [ :contraint | contraint width: 140 ];
				yourself)
			withConstraints: [ :contraint | contraint height: self toolbarHeight ];
		yourself
]

{ #category : #examples }
FDFileNavigationSystemPresenter class >> example [
	<example>
	| presenter |
	presenter := self new.
	"presenter defaultFolder: FileLocator documents."
	presenter previewer: FDPNGPreviewer new.
	presenter openWithSpec.
	presenter inspect.
	^ presenter
]

{ #category : #'class initialization' }
FDFileNavigationSystemPresenter class >> initialize [
	FilterSet := self defaultFilterSet.
	Previewer := self defaultPreviewer.
	Columns := self defaultColumns collect: #column.
	Directory := self defaultDirectory
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> columns [
	^ columns
]

{ #category : #'api-customization' }
FDFileNavigationSystemPresenter >> columns: aCollectionOfColumns [
	| tmpColumn |
	tmpColumn := aCollectionOfColumns asSet.
	tmpColumn
		addAll:
			({FDIconFileReferenceTableColumn.
			FDbasenameFileReferenceColumn} ).
	fileReferenceTable
		columns: ((tmpColumn asOrderedCollection sort: #sortValue ascending) collect: #column)
]

{ #category : #utils }
FDFileNavigationSystemPresenter >> createDirectory [
	^ self createDirectory: 'new-folder'
]

{ #category : #utils }
FDFileNavigationSystemPresenter >> createDirectory: initialName [
	| name path |
	name := (UIManager default
		request: 'Folder name'
		initialAnswer: initialName
		title: 'Create New Folder') ifNil: [ ^ self ].
	path := currentDirectory / name.
	path exists
		ifFalse: [ (currentDirectory / name) ensureCreateDirectory.
			self openFolder: currentDirectory.
			^ self ].
	path isDirectory
		ifTrue: [ UIManager default alert: 'A folder with that name already exists.' ].
	path isFile
		ifTrue: [ UIManager default alert: 'A file with that name already exists.' ].
	self createDirectory: name
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> currentDirectory [ 
	^ currentDirectory
]

{ #category : #'initialize-actions' }
FDFileNavigationSystemPresenter >> currentPathTextInputAction [
	currentPathTextInputPresenter entityText 
		whenTextIsAcceptedDo: [ :text | 
			text asFileReference exists
				ifFalse: [ self
						inform: 'you have to write an absolute path and an existing one' ]
				ifTrue: [ self openFolder: text asFileReference ] ]
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> currentPathTextInputPresenter [
	^ currentPathTextInputPresenter
]

{ #category : #'api-customization' }
FDFileNavigationSystemPresenter >> defaultFolder: aFileReference [
	self updateWidgetWithFileReference: aFileReference.
	readPointerHistoryParcour value: aFileReference
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> fileReferenceTable [
	^ fileReferenceTable
]

{ #category : #'initialize-actions' }
FDFileNavigationSystemPresenter >> filesListAction [
	fileReferenceTable
		transmitTo: nameText
		transform: [ :selectedItem | selectedItem basename ].
	fileReferenceTable
		whenActivatedDo: [ :selectedItem | 
			selectedItem selectedItem isDirectory
				ifTrue: [ self openFolder: selectedItem selectedItem ] ].
	fileReferenceTable
		whenSelectionChangedDo: [ :aFileReference | 
			notebookPreviewer
				page: (previewer previewOn: aFileReference selectedItem) ].
	fileReferenceTable whenModelChangedDo: [ LastDirectoryVisit := currentDirectory ]
]

{ #category : #'api-customization' }
FDFileNavigationSystemPresenter >> filtersCustomization: aCollectionOfFilter [
	"i always add the filter 'no filter'"

	filtersDropList
		items:
			(aCollectionOfFilter asOrderedCollection
				add: FDDefaultFilter new;
				yourself) asSet asOrderedCollection.
	filtersDropList
		selectedIndex:
			((filtersDropList listItems collect: #name)
				indexOf: FDDefaultFilter new name)
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> filtersDropList [
	^ filtersDropList
]

{ #category : #'initialize-actions' }
FDFileNavigationSystemPresenter >> filtersDropListAction [
	filtersDropList
		whenSelectionChangedDo: [ self updateWidgetWithFileReference: currentDirectory ]
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> hiddenFilter [
	^ hiddenFilter
]

{ #category : #'initialize-widgets' }
FDFileNavigationSystemPresenter >> initializeCurrentPathTextInput [
	currentPathTextInputPresenter currentDirectory: currentDirectory
]

{ #category : #'initialize-widgets' }
FDFileNavigationSystemPresenter >> initializeFilesTable [
	fileReferenceTable
		contextMenu: [ (self rootCommandsGroup / 'interact with file') beRoot
				asMenuPresenter ].
	fileReferenceTable
		columns: columns;
		sortingBlock: [ :a :b | 
			(a isDirectory & b isDirectory not
				or: [ a isDirectory & b isDirectory
						& (a basename asLowercase < b basename asLowercase) ])
				or: [ a isFile & b isFile
						& (a basename asLowercase < b basename asLowercase) ] ]
]

{ #category : #'initialize-widgets' }
FDFileNavigationSystemPresenter >> initializeFiltersDropList [
	| filterItems |
	filterItems := FilterSet copy.
	filterItems asOrderedCollection add: FDDefaultFilter new.
	filterItems := filterItems asSet.
	filtersDropList
		items: filterItems asOrderedCollection;
		display: [ :item | item name ];
		selectIndex:
			((filtersDropList listItems collect: #name)
				indexOf: FDDefaultFilter new name)
]

{ #category : #initialization }
FDFileNavigationSystemPresenter >> initializePresenter [
	self filesListAction.
	self filtersDropListAction.
	self currentPathTextInputAction.
	self previousBeforeButtonAction.
	self nextButtonAction
]

{ #category : #initialization }
FDFileNavigationSystemPresenter >> initializeWidgets [
	currentDirectory := Directory copy.
	columns := Columns.
	hiddenFilter := FDHidenFilter new.
	previewer := Previewer.
	
	notebookPreviewer := self instantiate: FDNoteBookPreviewerPresenter.
	fileReferenceTable := self newTable.
	currentPathTextInputPresenter := self instantiate: FDWindowPathPresenter.
	currentPathTextInputPresenter presenterUI: self.
	nameLabel := self newLabel.
	nameText := self newTextInput.
	filtersDropList := self newDropList.
	previousButton := self newButton.
	nextButton := self newButton.
	readPointerHistoryParcour := DoubleLink value: currentDirectory.
	nextButton icon: (self iconNamed: #glamorousDiveRight).
	previousButton icon: (self iconNamed: #back).
	nameLabel label: 'Name:'.
	nameText autoAccept: true.
	self initializeCurrentPathTextInput.
	self initializeFilesTable.
	self initializeFiltersDropList.
	self updateWidgetWithFileReference: FileSystem workingDirectory.
	self focusOrder
		add: previousButton;
		add: nextButton;
		add: currentPathTextInputPresenter;
		add: fileReferenceTable;
		add: nameText;
		add: filtersDropList
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> nameLabel [
	^ nameLabel
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> nameText [
	^ nameText
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> nextButton [
	^ nextButton
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> nextButtonAction [
	nextButton
		action: [ readPointerHistoryParcour hasSuccessor
				ifFalse: [ self
						inform:
							'this button is use to go after clicking on <- button to return on the last directory' ]
				ifTrue: [ readPointerHistoryParcour := readPointerHistoryParcour nextLink.
					self
						updateWidgetWithFileReference: readPointerHistoryParcour value ] ]
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> notebookPreviewer [
	^ notebookPreviewer
]

{ #category : #utils }
FDFileNavigationSystemPresenter >> openFolder: aFileReference [
	self updateWidgetWithFileReference: aFileReference.
	self updateHistoryList.
	
]

{ #category : #utils }
FDFileNavigationSystemPresenter >> openOn: anAbsolutePath [
	currentDirectory := anAbsolutePath asFileReference.
	self updateTableContent.
	self currentPathTextInputPresenter
		updatePathInputWith: currentDirectory.
	self updateHistoryList
]

{ #category : #acccessing }
FDFileNavigationSystemPresenter >> previewer [
	^ previewer
]

{ #category : #'api-customization' }
FDFileNavigationSystemPresenter >> previewer: aPreviewer [ 
	previewer := aPreviewer 
]

{ #category : #'initialize-actions' }
FDFileNavigationSystemPresenter >> previousBeforeButtonAction [
	previousButton
		action: [ readPointerHistoryParcour hasPredecessor
				ifFalse: [ self inform: 'this button is used to go to the last directory ' ]
				ifTrue:
					[ readPointerHistoryParcour := readPointerHistoryParcour previousLink.
					self updateWidgetWithFileReference: readPointerHistoryParcour value  ] ]
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> previousButton [
	^ previousButton
]

{ #category : #accessing }
FDFileNavigationSystemPresenter >> readPointerHistoryParcour [
	^ readPointerHistoryParcour
]

{ #category : #utils }
FDFileNavigationSystemPresenter >> toggleHiddenFiles [
	(hiddenFilter equals: FDDefaultFilter  new)
		ifTrue: [ hiddenFilter := FDHidenFilter new ]
		ifFalse: [ hiddenFilter := FDDefaultFilter new ].
	self updateTableContent
]

{ #category : #utils }
FDFileNavigationSystemPresenter >> updateHistoryList [
	readPointerHistoryParcour
		nextLink:
			((DoubleLink value: currentDirectory)
				previousLink: readPointerHistoryParcour;
				yourself).
	readPointerHistoryParcour := readPointerHistoryParcour nextLink
]

{ #category : #utils }
FDFileNavigationSystemPresenter >> updateTableContent [
	fileReferenceTable
		items:
			(hiddenFilter
				applyOn: (filtersDropList selectedItem applyOn: currentDirectory children))
]

{ #category : #utils }
FDFileNavigationSystemPresenter >> updateWidgetWithFileReference: aFileReference [
	currentDirectory := aFileReference.
	self updateTableContent.
	currentPathTextInputPresenter currentDirectory: currentDirectory
]
