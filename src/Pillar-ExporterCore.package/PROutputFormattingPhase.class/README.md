I take as input a compilation context with a pillar document ast. I process it and generate a text using the configured writer. A writer could be for example:
 - html
 - latex

I provide for subsequent phases a compilation context with a PROutputDocument.