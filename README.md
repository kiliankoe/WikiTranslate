# 📖 WikiTranslate

Have you ever had troubles looking up the translation of a term with several ambiguities? I know I have. One of the best ways to overcome this (at least in my opinion) is to use the Wikipedia as your dictionary. You look up your term and use the linked articles in other languages as a base for translation.

That's what this tool does for you. Enter your term, choose the correct article and look at the translations. Easy as pie.

## Usage

`$ wt <lang-id> <search-term>`

e.g.

```
$ wt de lab
Found the following 15 results for 'lab'
0) Lab - Gemisch aus den Enzymen Chymosin und Pepsin
1) Labret-Piercing - Schmuck im Lippenbereich
2) Labrador Retriever - Hunderasse
3) Labyrinth
 ...

Please enter the number of the result you want to translate.
0
Alemannisch: Lab
aragonés: Cuallo
العربية: منفحة
català: Quall
corsu: Pirrulu
čeština: Syřidlo
dansk: Osteløbe
Ελληνικά: Πυτιά
English: Rennet
español: Cuajo
eesti: Laap
 ...
```

(Yes, translating 'lab' is why I wanted this tool to exist. Maybe not the best term, but it's a good example, since I had no clue the english word 'rennet' existed.)

## Installation

todo

## Shortcomings

Obviously WikiTranslate has a vocabulary much _much_ smaller than your typical run-of-the-mill dictionary. It basically only makes sense as a fallback or when you're sure that the term you're looking for has it's own Wikipedia page (in both or all the languages you need).

Also some pages make it quite hard to use this method of translation, most notably animal species.
