grammar - Text
text
	"A text is a PRText with a string that contains any character inside."

	^ super text ==> [ :array | 
			(PRText content: (self stringFrom: array second))
				start: array first start;
				stop: array third stop ]