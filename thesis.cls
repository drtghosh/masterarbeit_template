%%
%% LaTeX class file for VCI themed master's and bachelor's thesis.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2016/04/08 VCI Thesis Template]

 %% Fallback
\DeclareOption*{
    \ClassWarning{thesis}{Unknown option '\CurrentOption'}
}

\ProcessOptions\relax

\LoadClass[12pt,twoside,a4paper]{book}

\RequirePackage{etoolbox}
\RequirePackage[utf8]{inputenc}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[pass]{geometry}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{textcomp}
\RequirePackage{dsfont}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{verbatim}
\RequirePackage[citestyle=ieee-alphabetic,bibstyle=alphabetic,sorting=nyt,hyperref=auto,maxcitenames=3,maxbibnames=99,backref=true]{biblatex}
\RequirePackage[font=small,margin=0em,labelfont=bf]{caption}
\RequirePackage[inline,shortlabels]{enumitem}
\RequirePackage[capitalise]{cleveref}
\RequirePackage{makeidx}
\RequirePackage{tikz}
\RequirePackage{thesis-macros}
\RequirePackage{thesis-hyphenation}
\RequirePackage{appendix}
\RequirePackage{times}
\RequirePackage{tabularx}
\RequirePackage{environ}

\usetikzlibrary{calc,arrows.meta}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Some global settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeindex

\bibliography{references}
\DefineBibliographyStrings{english}{%
  backrefpage = {cited on page},
  backrefpages = {cited on pages},
}

\theoremstyle{plain}% default
\newtheorem{thm}{Theorem}[chapter]
\newtheorem{lem}[thm]{Lemma}
\newtheorem{cor}{Corollary}[chapter]

\newcommand{\problemtitle}[1]{\gdef\@problemtitle{#1}}% Store problem title
\newcommand{\probleminput}[1]{\gdef\@probleminput{#1}}% Store problem input
\newcommand{\problemquestion}[1]{\gdef\@problemquestion{#1}}% Store problem question
\newcommand{\problemoutput}[1]{\gdef\@problemoutput{#1}}% Store problem output
\NewEnviron{problem}{
  \problemtitle{}\probleminput{}\problemquestion{}% Default input is empty
  \BODY% Parse input
  \par\addvspace{.5\baselineskip}
  \noindent
  \begin{tabularx}{\textwidth}{@{\hspace{\parindent}} l X c}
    \multicolumn{2}{@{\hspace{\parindent}}l}{\@problemtitle} \\% Title
    \textbf{Input:} & \@probleminput \\% Input
    \textbf{Question:} & \@problemquestion% Question
  \end{tabularx}
  \par\addvspace{.5\baselineskip}
}
\NewEnviron{problemnotitle}{
    \probleminput{}\problemoutput{}% Default input is empty
    \BODY% Parse input
    \par\addvspace{.5\baselineskip}
     \begin{tabularx}{\textwidth}{@{\hspace{\parindent}} l X c}
        \textbf{Input:} & \@probleminput \\% Input
        \textbf{Output:} & \@problemoutput % Output
      \end{tabularx}
      \par\addvspace{.5\baselineskip}
}

\setlength{\headheight}{14.5pt}
\lhead[\fancyplain{}{\thepage}]{\fancyplain{}{\nouppercase{\rightmark}}}
\rhead[\fancyplain{}{\nouppercase{\leftmark}}]{\fancyplain{}{\thepage}}
\cfoot[\fancyplain{\thepage}{}]{\fancyplain{\thepage}{}}

\pagestyle{fancyplain}

% no single lines separated from paragraphs
\widowpenalty10000
\clubpenalty10000

% figure stuff
\newsavebox{\largestimage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters for title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\thesisTitle#1{\gdef\@thesisTitle{#1}}
\def\@thesisTitle{\@latex@warning@no@line{No \noexpand\thesisTitle given.}{\texttt{\color{red}[No \textbackslash{}thesisTitle given.]}}}

\def\thesisType#1{\gdef\@thesisType{#1}}
\def\@thesisType{\@latex@warning@no@line{No \noexpand\thesisType given.}{\texttt{\color{red}[No \textbackslash{}thesisType given.]}}}

\def\thesisAuthor#1{\gdef\@thesisAuthor{#1}}
\def\@thesisAuthor{\@latex@warning@no@line{No \noexpand\thesisAuthor given.}{\texttt{\color{red}[No \textbackslash{}thesisAuthor given.]}}}

\def\thesisStudentID#1{\gdef\@thesisStudentID{#1}}
\def\@thesisStudentID{\@latex@warning@no@line{No \noexpand\thesisStudentID given.}{\texttt{\color{red}[No \textbackslash{}thesisStudentID given.]}}}

\def\thesisMonth#1{\gdef\@thesisMonth{#1}}
\def\@thesisMonth{\@latex@warning@no@line{No \noexpand\thesisMonth given.}{\texttt{\color{red}[No \textbackslash{}thesisMonth given.]}}}

\def\thesisAdvisor#1{\gdef\@thesisAdvisor{#1}}
\def\@thesisAdvisor{\@latex@warning@no@line{No \noexpand\thesisAdvisor given.}{\texttt{\color{red}[No \textbackslash{}thesisAdvisor given.]}}}

\def\thesisPrimaryReviewer#1{\gdef\@thesisPrimaryReviewer{#1}}
\def\@thesisPrimaryReviewer{\@latex@warning@no@line{No \noexpand\thesisPrimaryReviewer given.}{\texttt{\color{red}[No \textbackslash{}thesisPrimaryReviewer given.]}}}

\def\thesisSecondaryReviewer#1{\gdef\@thesisSecondaryReviewer{#1}}
\def\@thesisSecondaryReviewer{\@latex@warning@no@line{No \noexpand\thesisSecondaryReviewer given.}{\texttt{\color{red}[No \textbackslash{}thesisSecondaryReviewer given.]}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makeTitle}{%
\newgeometry{left=3.5cm,right=2.5cm,top=4cm,bottom=2.5cm}
\begin{titlepage}
\parindent0pt
\parskip0pt
\tikz[remember picture, overlay]
  \node[inner sep=1cm, outer sep=0pt, below left] at (current page.north east) {
    \includegraphics[height=2cm]{rwth-vci-logo}};
\begin{centering}
  {\footnotesize
  The present work was submitted to the\\
  \vspace*{.75cm}
  Visual Computing Institute\par
  Faculty of Mathematics, Computer Science and Natural Sciences\par
  RWTH Aachen University\par}
  \vspace*{\stretch{2}}\par
  {\LARGE\bfseries\@thesisTitle\par}
  \vspace*{.75cm}
  {\bfseries\@thesisType\par}

  \vspace*{.75cm}
  presented by\par
  \vspace*{.75cm}
  {\@thesisAuthor\par}
  {\small Student ID Number \@thesisStudentID}\par

  \vspace*{.75cm}
  \@thesisMonth

  \vspace*{\stretch{2}}
  \begin{tabular}{ll}
  First Examiner: &\@thesisPrimaryReviewer\\
  Second Examiner: &\@thesisSecondaryReviewer\\
  Advisor(s): &\@thesisAdvisor\\
  \end{tabular}\par
\end{centering}
\eject
\thispagestyle{empty}
\end{titlepage}
\restoregeometry
} %\makeTitle

\newcommand{\makeFrontMatter}{
\frontmatter
\makeTitle
\cleardoublepage
{%
\pagestyle{plain}
\include{affirmation}
\cleardoublepage
}
{%
\tableofcontents
\cleardoublepage
}
} %\makeFrontMatter

\endinput
