# Media Backup

To backup media, use the following command:

```
cd /Volumes/Media
sudo rm -rf .DocumentRevisions-V100/ .Spotlight-V100/ .TemporaryItems/ .Trashes/
sudo rsync -aE --progress /Volumes/Media "/Volumes/Media Backup/2019-07-01 - Media Backup/"
```
