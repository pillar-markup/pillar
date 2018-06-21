I am a visitor specialized in visiting books and testing their code. Therefore, I only redefine visitCodeBlock:

I gather all results as PRBookTestResult s in allTestsResults. checkAll is a boolean ordering me to evaluate every code block or only the ones with the parameter testable.

visitCodeblock: uses executeAndReport: creating a PRBookTestResult with the result of the evaluation of the codeblock.

checkAndReportFileNamed: starts the visit in a given file.




