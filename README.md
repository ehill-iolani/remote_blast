# remote_blast
This is a simple container to remote BLAST .fasta files with one simple command. 
This will automatically collect and BLAST all of the .fasta files in your current working directory. 
The output will return as a .xml in order for blastR visualization.

-Standalone BLAST tool that will BLAST sequences in .fasta format 

-BLAST against GenBANK using NCBI API

-Automatically generates results summary at the end of the BLAST search

### Installation (method 1):
Clone the github respository and then build the docker image from the dockerfile
```
git clone https://github.com/ehill-iolani/remote_blast.git
cd remote_blast
docker build --no-cache -t remote_blast:local .
```

Make sure the image built by checking that it exists in your local images
```
docker image ls
```

### Installation (method 2)
A prebuilt image version can be retrieved here:
```
docker pull ethill/remote_blast:latest
```

Make sure the image built by checking that it exists in your local images
```
docker image ls
```

### Running the image
Once the image has been downloaded or built you can run the image with the following command can navigate to the data directory
```
docker run --name=remote_blast --volume=/workspaces/codespaces-blank:/home/data -it remote_blast:local
cd /home/data
```

### Example remote_blast command:

```
remote_blast -g yes
```


### blastR can be retrieved here:
```
docker pull ethill/blastr:latest
```
