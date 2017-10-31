visiting-document
visitPreformatted: aPreformatted

	canvas precede: [ aPreformatted children do: [ :child | self visit: child ] separatedBy: [canvas newLine; raw: ' ' ]] by: ' '