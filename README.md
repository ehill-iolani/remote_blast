# remote_blast
This is a simple container to remote BLAST .fasta files with one simple command. 
This will automatically collect and BLAST all of the .fasta files in your current working directory. 
The output will return as a .xml in order for blastR visualization.

-Standalone BLAST tool that will BLAST sequences in .fasta format 

-BLAST against GenBANK using NCBI API

-Automatically generates results summary at the end of the BLAST search


### A containerized version can be retrieved here:
```
docker pull ethill/remote_blast:latest
```

### Example remote_blast command:

```
decona_remote_blast -g yes
```
### blastR can be retrieved here:
```
docker pull ethill/blastr:latest
```
