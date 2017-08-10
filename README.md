# Pillar

Markup syntax and associated tools to write and generate documentation, books and slides

[http://www.smalltalkhub.com/#!/~Pier/Pillar](http://www.smalltalkhub.com/#!/~Pier/Pillar)

Read the documentation at [https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html).
[Other formats](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifactbook-result/PillarChap/)

## Download Pillar (50)

```
wget https://raw.githubusercontent.com/pillar-markup/pillar/master/download.sh
chmod +x download.sh
./download.sh
```
## Obtaining the software
you can find the pharo image 

[https://ci.inria.fr/pharo-contribution/job/pillar/](https://ci.inria.fr/pharo-contribution/job/pillar/)

## Follow the tutorial

[https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html]

## To set up a booklet 

```
./pillar archetype book
make spiral
```

## You can get everything prepackaged

Sometimes installing LaTeX can be cumbersome. You can use a docker install with everything prepackaged. 

```
https://github.com/cdlm/docker-texlive
```

## Tips

Just a little note to be able to use travis to publish the pdf on git. 
In the git repo

```
gem install travis
travis setup releases
```
