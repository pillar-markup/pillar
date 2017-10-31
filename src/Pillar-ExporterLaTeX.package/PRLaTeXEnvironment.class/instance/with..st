accessing
with: aBlock
	stream newLine.
	aBlock value.
	(stream << '\end{' << name)
		<< '}';
		newLine