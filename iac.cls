%% IAC CLASS
%% author: mariusz slonina, mariusz.slonina@gmail.com
%%         giorgio mingotti, giorgio.mingotti@gmail.com
%% last updated: 03/09/2012
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iac}[2013]

%% BUILD UPON THE MEMOIR CLASS
\LoadClass[10pt,twocolumn,twoside,article]{memoir}

%% REQUIRED PACKAGES
\RequirePackage[utf8]{inputenc}
\RequirePackage{array,graphicx,url}
%\RequirePackage{fix-cm}%encoding fix for sans serif shape
%\RequirePackage[sc]{mathpazo}%palatino
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amsfonts,amssymb}
%\RequirePackage[english]{babel}
%\selectlanguage{english}
%\usepackage{polski}
%\RequirePackage[authoryear, round, comma, sort&compress]{natbib}
%\RequirePackage{chapterbib}

% Use Times New Roman
\usepackage{times}

%% THE LAYOUT
\setstocksize{297mm}{210mm}
\settrimmedsize{\stockheight}{\stockwidth}{}
\setlength{\trimtop}{0pt}
\setlength{\trimedge}{\stockwidth}
\addtolength{\trimedge}{-\paperwidth}
\setlrmarginsandblock{0.7in}{0.7in}{}%\setlrmarginsandblock{1.0in}{1.0in}{}
\setulmarginsandblock{1.0in}{1.0in}{}
\checkandfixthelayout

%%THE TYPOGRAPHY
\def\dywiz{\ensuremath{\textrm{\kern.1em-\kern.1em}}}
\def\dyw{\ensuremath{\textrm{\kern.1em-\kern.1em}}}
\def\ts{\kern.20em}
\renewcommand{\!}{\kern.20em}

\newcommand\keywordsname{{\bfseries Keywords}}
\newcommand\keywordsfont{\sffamily\footnotesize}
\newcommand\authorsfont{\normalsize}
\newcommand\headfont{\sffamily\footnotesize\bfseries}
\newcommand\titlefont{\normalsize}
\renewcommand\normalsize{\small}

\setlength\multlinegap{0pt}
\linespread{1.1}
\parindent=1.5em
\parskip=0em
\setlength\floatsep{\baselineskip}
\setlength\dblfloatsep{\baselineskip}
\setlength\textfloatsep{\baselineskip}
\setlength\dbltextfloatsep{\baselineskip}
\setlength\footparindent{0em}
\setlength\footmarkwidth{0em}
\setlength\footmarksep{0.333em}

%% WORK INFORMATION
\def\keywords#1{\gdef\@keywords{#1}}
\def\iabstract#1{\gdef\@iabstract{#1}}
%\def\email#1{\gdef\@email{#1}}
%\def\affi#1{\gdef\@affi{#1}}

%% SPECIAL COMMANDS
\newcommand{\bv}[1]{\mathbf{#1}}
\newcommand{\p}{ \ensuremath{\pm} }
\newcommand{\degree}{\ensuremath{^\circ}}
\newcommand{\megno}{$\langle Y \rangle$}
\newcommand{\smegno}{$\mathsf{\langle Y \rangle}$}
\newcommand{\bdelta}{\ensuremath{\pmb \delta}}
\newcommand{\DTP}{{\sffamily\bfseries Desktop Publishing}}
\newcommand{\memoir}{{\sffamily\bfseries memoir}\ }
\newcommand{\texlive}{\TeX live\ }
\newcommand{\bibtex}{Bib\TeX\ }

%% ABSTRACTS
\renewcommand{\abstracttextfont}{\normalsize}
\renewcommand{\abstractnamefont}{\bfseries}
\setlength\absleftindent{0pt}
\setlength\absrightindent{0pt}

%% CHAPTER STYLE
\makechapterstyle{iac}{%
\renewcommand{\chapnumfont}{}
\renewcommand{\chaptitlefont}{\titlefont}
\renewcommand{\chapnamefont}{}
\renewcommand{\printchapternum}{}
\renewcommand{\printchaptername}{}
\renewcommand{\afterchapternum}{}
}%
\setlength{\beforechapskip}{0pt}
%% quick and dirty fix for natbib references
%% this replaces chapter style with section style
%% thus, altought we use chapter, end user sees section without number
%% natbib [sectionbib] does not work!
\chapterstyle{article}
\renewcommand{\chaptitlefont}{\secheadstyle}

%% SECTIONS
\setsecnumdepth{subsubsection}

\setsecheadstyle{\Large\bfseries\flushleft}
\setsubsecheadstyle{\scshape\flushleft}
\setsubsubsecheadstyle{\rmfamily\flushleft}
%\setaftersecskip{0.0\baselineskip}
%\setaftersubsecskip{0.0\baselineskip}
%\setaftersubsubsecskip{0.0\baselineskip}
%\setsecnumformat{\csname the#1\endcsname.\ }
%% remove unneeded chapter number from section headers
\renewcommand\thesection{\uppercase{\arabic{section}}.}
\renewcommand\thesubsection{\thesection\uppercase{\arabic{subsection}}}


%% THE TITLE
%% add optional short title and short author
%% Beamer approach
\renewcommand{\title}{\@dblarg\iac@title}
\long\def\iac@title[#1]#2{%
    \def\@inserttitle{#2}
    \def\iac@shorttitle{#1}
}
\renewcommand{\author}{\@dblarg\iac@author}
\long\def\iac@author[#1]#2{%
    \def\@insertauthor{#2}
    \def\iac@shortauthor{#1}
}
\newcommand{\insertshortauthor}[1][]{
\let\thanks=\@gobble
\def\@insertshortauthor{#1}
\iac@shortauthor
}
\newcommand{\insertshorttitle}[1][]{
\let\thanks=\@gobble
\iac@shorttitle
}

%% redefine the titlepage
\def\maketitle{
\twocolumn[
%\thispagestyle{plain}
\begin{center}
IAC-16-C1.4.8
\vskip \baselineskip
{\titlefont\@inserttitle}
\vskip \baselineskip
{\noindent\authorsfont\@insertauthor} 
\end{center}
\vskip \baselineskip
%%abstract redefinition
{\noindent\abstracttextfont\@iabstract}\par
\vskip \baselineskip
%%keywords
%{\noindent\keywordsfont\keywordsname:\quad\@keywords}
%\vskip \baselineskip
]
\@thanks
}

\thanksmarkseries{fnsymbols}
\symbolthanksmark


%% HEADERS AND FOOTERS
\makeoddfoot{plain}{}{}{{\headfont IAC manuscripts\quad\thepage}}
\makeevenfoot{plain}{}{}{{\headfont\thepage\quad IAC manuscripts}}

\makepagestyle{iachead}
\makeheadrule{iachead}{\textwidth}{0pt}
\makeevenfoot{iachead}{IAC-16-C1.4.8}{}{Page \thepage\ of \thelastpage}
\makeoddfoot{iachead}{IAC-16-C1.4.8}{}{Page \thepage\ of \thelastpage}
\makeevenhead{iachead}{}{\footnotesize {67$^{\mathrm{th}}$ International Astronautical %
Congress, Guadalajara, Mexico. Copyright \copyright 2016 by Simone Ceccherini.}}{}
\makeoddhead{iachead}{}{\footnotesize {67$^{\mathrm{th}}$ International Astronautical %
Congress, Guadalajara, Mexico. Copyright \copyright 2016 by Simone Ceccherini.}}{}
\pagestyle{iachead}

%% FIGURE/TABLE CAPTIONS
%define subfloats, we don't use subfig/subfigure
\newsubfloat{figure}
\newsubfloat{table}

\renewcommand{\figurename}{Fig.}
\captiondelim{: }
\hangcaption
%\captionnamefont{\footnotesize}
%\captiontitlefont{\footnotesize}
%new legend
\newcommand{\tlegend}[1]{\legend{\tiny\normalfont #1}}

%% table caption
\renewcommand{\tablename}{Tab.}
\newcommand{\tcaption}[2][\@empty]{
\hangcaption
%\captionnamefont{\scshape\footnotesize}
\captiondelim{: }
%\captiontitlefont{\footnotesize\scshape}
%\setlength{\belowcaptionskip}{.7\baselineskip}
\ifx #1\@empty \caption{#2}\else \caption[#1]{#2}}

%%% THE BIBLIOGRAPHY
%\bibliographystyle{iac}
%\bibpunct[; ]{(}{)}{;}{a}{,}{,}
%\setlength{\bibsep}{1pt}
%\renewcommand{\prebibhook}{\footnotesize}
%\renewcommand{\bibsection}{\prebibhook}
%\renewcommand{\bibname}{References}
%\nobibintoc
%\renewcommand{\bibsection}{%
%\section*{\bibname}
%\prebibhook}
%%change name of the bibliography
%% this is a hack if You use babel package
%%\addto\captionsenglish{
%%\renewcommand\bibname{References}
%%}

%acknowledgments
\def\acknowledgments{\section*{ACKNOWLEDGMENTS}}

%warning
\newcommand{\warning}[1]{{\bfseries #1}}

%% IAC CLASS ENDS
