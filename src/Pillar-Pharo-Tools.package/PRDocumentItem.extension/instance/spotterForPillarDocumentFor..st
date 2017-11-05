*Pillar-Pharo-Tools
spotterForPillarDocumentFor: aStep
	<spotterOrder: 40>
	aStep listProcessor 
		title: 'Children';
		candidatesLimit: Float infinity;
		allCandidates: [ self children ];
		itemName: [:item | (PRToolLabelSelector new)
									visit: item;
									label ];
		itemIcon: [:item | (PRToolIconSelector new)
									visit: item;
									icon ];
		matchSubstring