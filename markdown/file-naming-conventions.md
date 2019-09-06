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

### Book Collection

Books are automatically named by _Calibre_. The names used are stored in the `metadata.db` file created by _Calibre_.

The properties `Title`, `Title sort`, `Author(s)`, `Author sort`, `Published`, `Publisher`, `Languages` are entered in _Calibre_.

For `Published`: if the month of publication is not known, `01` is provided.

Subject `Title`: Title and subtitle are divided by the same separator as used on the title page. If no separator is used on the title page, `. ` (DE) or `: ` (EN) is used.

Examples taken from [https://help.goodreads.com/s/article/Librarian-Manual-Book-edit-page-the-title-field](https://help.goodreads.com/s/article/Librarian-Manual-Book-edit-page-the-title-field):


> #### Examples of subtitles:
> 
> - Anne Frank: The Diary of a Young Girl
> - Ghosts of Gettysburg: Spirits, Apparitions and Haunted Places of the Battlefield
> - Alice und das Land im Nadelöhr. Die weiteren Abenteuer von Alice im Wunderland
> - Birdsong: A Novel of Love and War
> 
> #### Not:
> 
> - Among the Living: A PsyCop Novel

### Music Collection

As has proved both simple and effective, files are structured in directories, as for example `/The Beatles/1965-08-06; Help! (album; soundtrack)/07 Ticket to Ride.mp3`

Files are named automatically by _MusicBrainz Picard_ based on ID3 tags present in the files.

In the options pane _File Naming_, the following settings are used:

- Move files when saving: `TRUE`
- Destination directory: `/Volumes/Media/Musik/` or `/Volumes/Media/Hörbücher/`
- Move additional files: `FALSE`
- Delete empty directories: `TRUE`
- Rename files when saving: `TRUE`
- Replace non-ASCII characters: `FALSE`
- Windows compatibility: `TRUE`
- Name files like this: `$if2(%albumartist%,%artist%)/$if($and(%date%,$not(%podcast%)),%date%; )%album%$if(%releasetype%, \(%releasetype%\))/$if(%podcast%,%date%,$if($gt(%totaldiscs%,1),%discnumber%-)$num(%tracknumber%,2))$if(%compilation%, - %artist%)$if(%title%, - %title%)`

For music files to be named properly, the following ID3 tags are required:

- `albumartist` or `artist`
- `album`
- `tracknumber`
- `date` (recommended, except for live bootlegs)
- `title` (recommended)
- `releasetype` (recommended)
- `totaldiscs` (optional)
- `discnumber` (optional)

Moreover, in case of compilations the attribute `compilation` with value `1` is added.

### Audiobook Collection

The same settings apply as in section _Music Collection_. In this context, ID3 tags are understoods as follows. Notable interpretations of tags are emphasized.

- **author, eg. "Franz Kafka"**: `artist`
- **audiobook title**: `album`
- track number: `tracknumber`
- audiobook release date: `date`
- **audiobook narrator**: `releasetype` (optional)
- number of discs: `totaldiscs` (optional)
- disc number: `discnumber` (optional)
- track title: `title` (optional)

In addition, the attribute `audiobook` must be set to `1` .

### Podcasts and Radio Broadcasts

The same settings apply as in section _Music Collection_. In this context, ID3 tags are understoods as follows:

- provided it remains the same for all episodes, name(s) of the episode host(s), else name of network, e.g. "Al Kavadlo" or "BBC Radio 1": `artist`
- **podcast series title**: `album`
- podcast episode release date: `date` (optional)
- podcast episode title: `title` (optional)
- podcast episode number, undefined for radio broadcasts: `tracknumber`
- podcast narrator: `releasetype` (optional)
- undefined: `totaldiscs` (deprecated)
- undefined: `discnumber` (deprecated)

In addition, the attribute `podcast` must be set to `1`.
