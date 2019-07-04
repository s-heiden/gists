# Steps to name music collection

1. Edit all files using MusicBrainz Picard.
    Required attributes:
        - `albumartist` or `artist`
        - `album`
        - `releasetype`
        - `totaldiscs`
        - `discnumber`
        - `tracknumber`
        - `title`
        - `date`
    Optional attributes:
        - `compilation` = `1` 

2. Check MusicBrain Picard settings. Make sure:
   - `Move files when saving` = `TRUE`
   - `Destination directory` = `/Volumes/Media/Musik/`
   - `Move additional files` = `FALSE`
   - `Delete empty directories` = `TRUE`
   - `Rename files when saving` = `TRUE`
   - `Replace non-ASCII characters` = `FALSE`
   - `Windows compatibility` = `TRUE`
   - `Name files like this` = `$if2(%albumartist%,%artist%)/$if(%date%, %date%; )%album%$if(%releasetype%, \(%releasetype%\))/$if($gt(%totaldiscs%,1),%discnumber%-,)$num(%tracknumber%,2)\$if(%compilation%, %artist% -,) %title%`

