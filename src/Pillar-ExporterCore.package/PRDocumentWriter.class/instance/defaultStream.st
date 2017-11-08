private
defaultStream
	self flag: #SD:shouldprobablybeanOutputStream.
	^ WriteStream on: String new