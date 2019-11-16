#!/bin/bash
# this dependency list is for LaTeX 2019
xargs tlmgr install <<DEPS
    ctablestack
    environ
    filehook
    fira
    fontspec
    footmisc
    gentium-tug
    graphics
    import
    listings
    luatexbase
    memoir
    multirow
    opensans
    pgf
    polyglossia
    hyphen-english
    ragged2e
    tcolorbox
    tools
    trimspaces
    ulem
    varwidth
    xcolor
DEPS
