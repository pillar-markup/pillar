#!/bin/bash
# this dependency list is for LaTeX 2019

xargs tlmgr install <<DEPS
    ctablestack
    environ
    filehook
    fira
    fontaxes
    fontspec
    footmisc
    gentium-tug
    graphics
    hyphen-english
    import
    listings
    luatexbase
    memoir
    multirow
    opensans
    pgf
    polyglossia
    ragged2e
    tcolorbox
    tools
    trimspaces
    ulem
    varwidth
    xcolor
    xtab
    slantsc
DEPS
