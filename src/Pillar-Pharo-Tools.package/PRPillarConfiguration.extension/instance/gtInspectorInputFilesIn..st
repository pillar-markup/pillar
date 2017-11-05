*Pillar-Pharo-Tools
gtInspectorInputFilesIn: composite
	<gtInspectorPresentationOrder: 40>
	^ composite list 
		title: 'Files';
		display: [(self propertyAt: 'inputFiles') collect: [:each | self baseDirectory resolveString: each ] ];
		format: [:each | each basename];
		when: [ self hasProperty: 'inputFiles' ];
		act: [
			| c | 
			c := self propertyAt: 'configurations' ifAbsent: [ #() ].
			c isEmpty 
				ifTrue: [ self export ] 
				ifFalse: [ c do: #export ] ] 
			icon: GLMUIThemeExtraIcons glamorousPlay 
			entitled: 'Export'