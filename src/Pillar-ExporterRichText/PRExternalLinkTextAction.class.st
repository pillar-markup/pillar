"
I am a link to an external ressource (URL).

It seems like I might only work on mac.
"
Class {
	#name : #PRExternalLinkTextAction,
	#superclass : #TextAction,
	#category : #'Pillar-ExporterRichText'
}

{ #category : #accessing }
PRExternalLinkTextAction class >> url: aZnUrl [
	^self new url: aZnUrl 
]

{ #category : #accessing }
PRExternalLinkTextAction >> url: aZnUrl [
	"On mac you might be able to do something like: actOnClickBlock: [ OSSVMProcess vmProcess systemAccessor
				system: 'open ' , aZnUrl asString ]"
	self
		actOnClickBlock: [ 
			PopupChoiceDialogWindow
				chooseFrom: #('OK')
				lines: #()
				title: 'Pretending to open url: ' , aZnUrl asString ]
]
