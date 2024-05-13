\ProvidesClass{HMA}[2023/09/19 v 1.0 WIF Template]

\RequirePackage{etoolbox}
\PassOptionsToPackage{internalonly}{scrbase}
\def\@clearglobaloption#1{%
	\def\@tempa{#1}%
	\def\@tempb{\@gobble}%
	\@for\next:=\@classoptionslist\do
	{\ifx\next\@tempa
		\message{Cleared  option \next\space from global list}%
		\else
		\edef\@tempb{\@tempb,\next}%
		\fi}%
	\let\@classoptionslist\@tempb
	\expandafter\ifx\@tempb\@gobble
	\let\@classoptionslist\@empty
	\fi}


\newif\ifen


\DeclareOption{de}{\PassOptionsToPackage{english,main=ngerman}{babel}\enfalse} % Deutsche Sprachunterstützung
\DeclareOption{en}{\PassOptionsToPackage{english}{babel}\entrue} % Englische Sprachunterstützung


\ExecuteOptions{en}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}

%% Process given options
\ProcessOptions\relax

\LoadClass[a4paper,twocolumn]{scrartcl}


\RequirePackage[bottom=20mm,left=20mm,right=20mm,top=20mm]{geometry} % Ränder ändern



\RequirePackage{babel}

% Schriftarten für PDFLaTeX und LuaTex
\RequirePackage{iftex}
\ifpdftex{% Unterstützung für PDFTeX
	\RequirePackage{tgtermes}			% Tex Gyre Termes (qtm (Times) als Font für Fließtext)
	\RequirePackage[utf8]{inputenc}		% Dateien in UTF-8 benutzen
	\RequirePackage[T1]{fontenc}		% Zeichenkodierung  
	
	
	
	\RequirePackage{morewrites}			% Verhindert Fehlermeldung: No more writes 
	\RequirePackage[scaled]{helvet}     % Schrift Helvetia laden
	\RequirePackage{amssymb}            % Mathematische Symbole  	
	
	%% Graphiken als pdf einfügen
	\pdfoptionpdfminorversion=8
	
	
	\else\ifluatex
	%LuaTex erwartet standardmäßig utf8 
	\RequirePackage{fontspec} %Font Unterstützung für LuaTex, welche das Laden von  OpenType fonts erlaubt. Fonts müssen im OS verfügbar sein. 
	\defaultfontfeatures{Ligatures=TeX} 
	\RequirePackage{unicode-math}
	\setromanfont[
	Extension=.otf,
	UprightFont={*-Regular},
	BoldFont={*-Bold},
	ItalicFont={*-Italic},
	BoldItalicFont={*-BoldItalic}
	]{texgyretermes}
	
	\setsansfont[
	Scale=MatchLowercase,% or MatchUppercase
	Extension=.otf,
	UprightFont=*-regular,
	ItalicFont=*-italic,
	BoldFont=*-bold,
	BoldItalicFont=*-bolditalic,
	]{texgyreheros}
	
	\fi\fi
	
	
	
	\newcommand{\semester}{\currentsemester~\semesteryear}
	\newcommand{\modul}{Wissenschaftliches Arbeiten für Fortgeschrittene}
	\newcommand{\modulk}{WIF}
	\newcommand{\studiengang}{IMSE/IMDS}
	\newcommand{\hsmaautor}{\hsmaautorvname \ \hsmaautornname} % Autor Vorname Nachname
	\newcommand{\hsmakoerperschaften}{University of Applied Sciences Mannheim}
	\newcommand{\hsmakoerperschaftde}{Hochschule Mannheim}
	\newcommand{\hsmaabstracttitlede}{Abstrakt}
	\newcommand{\hsmaabstracttitleen}{Abstract}
	

	\RequirePackage[manualmark]{scrlayer-scrpage}
	

	\setkomafont{pageheadfoot}{}% not special font for page head and foot
	\clearpairofpagestyles
	\ihead{\headmark}
	

	\ifen
		\ohead{Page \thepage\ of \pageref{LastPage}}
		\ifoot{\hsmakoerperschaften \ - Faculty Computer Science}
	\else
		\ohead{Seite \thepage\ von \pageref{LastPage}}
		\ifoot{\hsmakoerperschaftde \ - Fakultät Informatik}
	\fi


	\RequirePackage[backend=biber,
	sorting = none,
	%sortlocale=\hsmasortlocale,     % Sortierung der Einträge für Deutsch
	autocite=inline,                % regelt Aussehen für \autocite
	%      inline: Zitat in Klammern (\parancite)
	%      footnote: Zitat in Fußnoten (\footcite)
	%      plain: Zitat direkt ohne Klammern (\cite)
	style=numeric,         		      % Legt den Stil für die Angabe im Literaturverzeichnis fest
	%      numeric: Quellen mit Zahlen [1]
	%      ieee: Quellen mit Zahlen [1], nach IEEE-Regeln
	%      alphabetic: Quellen als Kürzel und Jahr [Ein05]
	%      authoryear: Quellen Author und Jahr [Einstein (1905)]
	citestyle=numeric-comp,         % Legt den Stil für die Zitate im Text fest
	%      numeric: Zitate mit Zahlen [1]
	%      numeric-comp: Kompakte Variante von numeric. [1, 2, 3] wird zu [1-3]
	%      ieee: Zitate mit Zahlen [1], nach IEEE-Regeln
	%      alphabetic: Zitate als Kürzel und Jahr [Ein05]
	%      authoryear: Zitate Author und Jahr [Einstein (1905)]
	hyperref=true,                  % Hyperlinks für Zitate
	maxbibnames=999,                % Maximale Anzahl der Autoren-Namen im Literaturverzeichnis
	maxcitenames=2,                 % Maximale Anzahl von Namen in einem Zitat
	mincitenames=1                  % Minimale Anzahl von Namen in einem Zitat
	]{biblatex}      % Literaturverwaltung mit BibLaTeX
	
	
	\RequirePackage{array}
	\RequirePackage{tabularx}
	\RequirePackage{longtable}
	\RequirePackage{booktabs}
	
	\RequirePackage{lipsum}
	\RequirePackage{blindtext}
	\RequirePackage{multicol}
	
	\RequirePackage{graphicx}
	\RequirePackage[most]{tcolorbox}


	\ifen
		\RequirePackage[autostyle=true,english=american]{csquotes} % Englische Anführungszeichen
		\RequirePackage[english,breaklinks=true,pdfproducer={},pdfcreator={},plainpages=false,
		pdfpagelabels]{hyperref}       % Hyperlinks
	%	\newcommand{\hsmasortlocale}{en_US}                    % Sortierung der Literatur
	\else
		\RequirePackage[autostyle=true,german=quotes]{csquotes}    % Deutsche Anführungszeichen
		\RequirePackage[breaklinks=true,pdfproducer={},pdfcreator={},plainpages=false,
		pdfpagelabels]{hyperref}        % Hyperlinks
	%	\newcommand{\hsmasortlocale}{de_DE} 
	\fi%
	

	\RequirePackage{lastpage}
	
	\RequirePackage[inline]{enumitem}
	\setenumerate{noitemsep}  %Kein Platz zwischen den Einträgen
	
	%\RequirePackage[useregional=numeric]{datetime2}		
	\newcommand{\semesteryear}{\the\year}
	
	%% Muss nach Datetime stehen!!
	\renewcommand*{\title}[2][]{\gdef\shorttitle{#1}\gdef\@title{#2}}
	\edef\title{\@nx\@dblarg
		\@xp\@nx\csname\string\title\endcsname}


	
	% Keywords command
	\newcommand{\keywords}[1]{
		\small	
		\textbf{\textit{Keywords --- }} #1
	}
	
	%Damit Inhaltsverzeichnis und Abstract in einem Zweispaltigen Layout über beide Spalten erstellt werden.
	\RequirePackage{cuted}
	
	%Herausschreiben der Dokumentinformationen bzw. Einlesen
	\RequirePackage{moreverb} 
	

	
	\immediate\write18{texcount -inc -incbib 
		-sum wif.tex > wordcount.tex}
	\newcommand\wordcount{
		\verbatiminput{wordcount.tex}}
	
	
	\AtBeginDocument{
		\markright{{\scshape \modul \ im \currentsemester~\semesteryear}}
		\titlehead{\thispagestyle{headings}}	
		\title[\hsmatitelshort]{\hsmatitel}
		\author{\hsmaautor}
		\date{\vspace{-8ex}}% clear date
	}
	
	
	%maketitle kann nicht in der Praembel ausgeführt werden. Da der Hook AtBeginDocument for begin Document ausgeführt wird, ist dies für maketitle zu früh.
	\AfterEndPreamble{%
		\maketitle
		
		\ifen
			\begin{strip}
				{\small 
					\begin{tcolorbox}[sidebyside,%righthand width=8cm,  
						sharp corners,boxrule=.4pt,colback=blue!5, left=2mm, right=2mm,boxsep=1pt,sidebyside align=top]
						\tableofcontents
						\tcblower
						{\large\sffamily\textbf{\hsmaabstracttitleen}}
						\hsmaabstract
					\end{tcolorbox}
				}
				\keywords{\hsmakeywords}
				\vspace*{0.75cm}
			\end{strip}
		\else
			\begin{strip}
				{\small 
					\begin{tcolorbox}[sidebyside,%righthand width=8cm,  
						sharp corners,boxrule=.4pt,colback=blue!5, left=2mm, right=2mm,boxsep=1pt,sidebyside align=top]
						\tableofcontents
						\tcblower
						{\large\sffamily\textbf{\hsmaabstracttitlede}}
						\hsmaabstract
					\end{tcolorbox}
				}
				\keywords{\hsmakeywords}
				\vspace*{0.75cm}
			\end{strip}
		\fi
	}


	\AtEndDocument{
		
		{\small 
			\printbibliography
		}
		
		
		\newpage
		\section*{Dokumentinformationen}
		{\tiny 
		%	\onecolumn
			\wordcount
		}
	}