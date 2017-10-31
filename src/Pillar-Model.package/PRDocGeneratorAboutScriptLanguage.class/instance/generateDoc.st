action
generateDoc
	"I return a Stream with the documentation of the script languages supported by pillar's script."

	PRRealScriptLanguage subclasses do: [ :subClass | self writeDocOf: subClass ].
	^ self stream