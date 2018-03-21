descriptions transcripted to chrysal
descriptionScrambledEmailAddresses
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #scrambledEmailAddresses;
		priority: 100;
		label: 'Scramble Email Addresses.';
		cocoonDocumentation:
				'Indicate if email addresses should appear scrambled to defeat the stupidest spammers looking for them (the default). If ==false==, email addresses will appear unscrambled.';
		default: true;
		yourself