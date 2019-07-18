# File naming conventions

## Web (HTML, JavaScript, TypeScript, Stylesheet)

> [N]ame folders and files completely in lowercase with no spaces […]The short answer is that you should use a hyphen for your file names.

https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/Dealing_with_files

## Markdown

> Good: `file-name.md`
>
> Bad, multiple consecutive hyphens: `file--name.md`
>
> Bad, surrounding hyphens: `-file-name-.md`

https://www.cirosantilli.com/markdown-style-guide/#file-name

This convention is also applied to folders containing markdown files.

## Python

> [L]owercase names. Underscores can be used in the module name if it improves readability

https://www.python.org/dev/peps/pep-0008/#package-and-module-names

## Shell

> Lowercase, with underscores to separate words if desired.
> Executables should have no extension (strongly preferred) or a `.sh` extension. Libraries must have a `.sh` extension and should not be executable.

https://google.github.io/styleguide/shell.xml

## AppleScript

> `askFinder.scpt`, `myScript.scpt`, `aScriptFile.scpt`, `makeFilterer.scpt`, `helloAS.scpt`

AppleScript: The Definitive Guide, 2nd Edition. Scripting and Automating Your Mac

## Documents and Document Folders

Since I have not found any best practices online, I continue to use the system that I have been using for years: `2019-05[-01] - Korrekte Rechtschreibung in deutscher Sprache, Schlagwörter getrennt mit Kommata für bessere Auffindbarkeit.doc`.

Document folder names are correctly capitalized and consist of orthographically correct nouns and spaces in English or German.

Files and folders can have a version number, separated by a space character, as the last part of the name, e.g. `2019-01 - Example document 0.0.1.docx`.

## Media Files

### Music Collection

As it has proved to be both simple and effective, music files are named automatically by MusicBrainz Picard using the following settings:

- `Move files when saving` = `TRUE`
- `Destination directory` = `/Volumes/Media/Musik/`
- `Move additional files` = `FALSE`
- `Delete empty directories` = `TRUE`
- `Rename files when saving` = `TRUE`
- `Replace non-ASCII characters` = `FALSE`
- `Windows compatibility` = `TRUE`
- `Name files like this` = `$if2(%albumartist%,%artist%)/$if(%date%, %date%; )%album%$if(%releasetype%, \(%releasetype%\))/$if($gt(%totaldiscs%,1),%discnumber%-,)$num(%tracknumber%,2)\$if(%compilation%, %artist% -,) %title%`

For music files to be named properly, the following attributes are required:

- `albumartist` or `artist`
- `album`
- `releasetype`
- `totaldiscs`
- `discnumber`
- `tracknumber`
- `title`
- `date`

Moreover, in case of compilations this attribute can be added:

- `compilation` = `1`
