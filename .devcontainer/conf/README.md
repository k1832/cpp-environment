# Configration files
Files in this directory are added to the container when the container is built.  
Some files are not added but lines in those files are added to the end of the existing files.  

Because they are added only when the container is built, you have to rebuild the container when you update these files.  

## Entirely copied
- .atcodertools.toml
## Copied to end of file
- .bashrc
