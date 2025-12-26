This is the new template used for Pharo with Style and Pharo by Example 9 and published via Book on Demand.

Pay attention that with LaTeX 2025 the template SBA 
has to be updated because gentium does not work the same way.

Was 

\RequirePackage{fontspec,gentiumbook,opensans,FiraMono}

\setmainfont{Gentium Book Plus}
\setsansfont{Open Sans}[
  \@ifpackagelater{opensans}{2019/06/19}% test for font naming bug
    {}% 2019/06/20 fixed it
    {BoldFont = {* Bold},}
  Scale=MatchLowercase,
  Numbers=OldStyle
]
\setmonofont{Fira Mono}[
  Scale=MatchLowercase,
  HyphenChar={-} % enable hyphenation (disabled by default in mono fonts)
  % caveat: LuaLaTeX doesn't support changing the actual character
  % alternative solution: \usepackage[htt]{hyphenat}
]

and not to be tested it should be 

\RequirePackage{fontspec,gentium-otf,opensans,FiraMono}

\setmainfont{Gentium}
\setsansfont{Open Sans}[
  \@ifpackagelater{opensans}{2019/06/19}% test for font naming bug
    {}% 2019/06/20 fixed it
    {BoldFont = {* Bold},}
  Scale=MatchLowercase,
  Numbers=OldStyle
]
