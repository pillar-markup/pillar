I will compare two folders and return a list of more recent files from the origin that should be copied in the target.

Does not work for now because we should create intermediary folders.
And in fact this is just an optimisation. 

PRFileComparor  new
	origin: '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks/Booklet-AMiniSchemeInPharo/';
	target: '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/PharoBooks/Booklet-AMiniSchemeInPharo/_result/pdf/';
	treat


Take the files from folder
Remove the dirty
Extract path from folder root
Build _result/path
if file does not exit 
then should be copied 
if file exist and date is older than the other one then should be copied.
 

