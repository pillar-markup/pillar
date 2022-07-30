To execute automatically the LaTeX build of book on travis you have two possibilities depending on the TexLive distribution. At the time of this writing we have 2018 (frozen) and 2019 (moving target).

The files ensure-deps-xxx and travisConfiguration-xxx.txt represent a configuration 
for each year. 

Copy ensure-deps-xxx.sh into ensure-deps.sh 
Copy travisConfiguration-xxx.txt  as the .travis.yml of your project and update the file data inside your project.