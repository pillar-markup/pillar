private
brush: aBrush
	self flush.
	currentBrush := aBrush.
	aBrush setStream: stream.
	^ aBrush