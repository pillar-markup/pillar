grammar - Script
script
	"I create a PRScript."

	^ super script ==> [ :array | 
		(PRCodeblock content: array fourth parameters: array third)
			start: array first start;
			stop: array last stop ]