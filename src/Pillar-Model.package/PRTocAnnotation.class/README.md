I'm an annotation use to generate some Table of contents. 

My tag is: 'toc''.

I have this form : 

${toc:depthLevel=x|level=y|highlight=true}$

The depthLevel is use to know the min level of title i need to use. I'll not print title lower than it.

The level is use to know what i need to print. I stay on the section x-1 and I stop at the next y title.

Highlight allow to highlight the current section (this might be vanish in the futur).

Example:

${toc:depthLevel=5|level=3|highlight=true}$
