% By Luc Fabresse, 2015

%-------------------------------------------------------------------------------
%                identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pharoslides}[2015/10/15 v1.0.0 Pharo MOOC beamer document class]

%-------------------------------------------------------------------------------
%                Commands
%-------------------------------------------------------------------------------

\newcommand{\usepharobeamertheme}{\usetheme{PharoMooc}}

\newcommand\@slidesid{{\color{red}WXSYY}}
\newcommand\slidesid[1]{
\def\temp{#1}\ifx\temp\empty
\else
\renewcommand\@slidesid{#1}
\fi
}


%-------------------------------------------------------------------------------
%                Class options
%-------------------------------------------------------------------------------

\DeclareOption{aspectratio=169}{
  \PassOptionsToClass{aspectratio=169}{beamer}}

\DeclareOption{withvideo}{
  \renewcommand{\usepharobeamertheme}{\usetheme[spaceforvideo]{PharoMooc}}
  \PassOptionsToClass{aspectratio=169}{beamer}%
}

% execute default options
% \ExecuteOptions{a4paper,11pt,final}

% process given options
\ProcessOptions\relax

%-------------------------------------------------------------------------------
%                Loading Packages
%-------------------------------------------------------------------------------

\LoadClass[handout]{beamer}

\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

% \RequirePackage[scaled=0.89]{DejaVuSans}
% \newcommand{\codefont}{\usefont{T1}{DejaVuSans-TLF}{el}{n}}
% \newcommand*{\codefont}{\fontfamily{DejaVuSans-TLF}\selectfont}

% \RequirePackage[light,nottdefault,t1]{sourcecodepro}
% \newcommand{\codefont}{\usefont{T1}{SourceCodePro-TLF}{l}{n}}

\RequirePackage[light,t1,scaled=1.08]{sourcesanspro}
\newcommand{\codefont}{\usefont{T1}{SourceSansPro-TLF}{l}{n}}


\RequirePackage{helvet}
 
\RequirePackage[absolute,showboxes,overlay]{textpos} 
\textblockorigin{0mm}{0mm} % origine des positions
\TPshowboxesfalse                                    

% \RequirePackage{tikz}
% \usetikzlibrary{arrows,shapes}
% \usetikzlibrary{trees}

% \RequirePackage{upquote}
% \RequirePackage{relsize}
% \RequirePackage{mathptmx}

\RequirePackage{enumitem} %pour personnalisation des listes numérotées (cf. beamerthemeMoocLab.sty)

\RequirePackage{booktabs}
\RequirePackage{textcomp}

\RequirePackage{upquote}
\newcommand\upquote[1]{\textquotesingle#1\textquotesingle}

\RequirePackage{wasysym} % \CIRCLE \Circle

\RequirePackage{calc}
\RequirePackage{ifthen}

%-------------------------------------------------------------------------------
%                Beamer Pharo Theme
%-------------------------------------------------------------------------------

\usepharobeamertheme

