# Create an RStudio Enviroment From Dockerfile with Consistent Packages Installed

My goal is to create an enviroment with RStudio for interactive building. 

Once building is complete. I want to be able to replicate the enviroment and deploy consistently. 

I might want to also invesigate workflow tools, to avoid always having to start from scratch. 

This workflow are personal notes and excerpts from the vignette posted at https://environments.rstudio.com/docker

## Launch Container with R Studio

I am launching the workstation. I have first logged into the workstation and isntalled docker-cd as described here. 

https://docs.docker.com/install/linux/docker-ce/ubuntu/

I then configured docker group to allow non root user commands as described here

https://docs.docker.com/install/linux/linux-postinstall/

I then tried to configure docker to automatically to start at boot suing instructions in the above link. I don't think this worked and not sure why. Error messages were related to possibly using Upstart? Not particulalry worried about this now. 

Launched dokcer with the following command

```
docker run -d -p 8790:8787 -v $(pwd):/home/rstudio -e USER=rstudio -e USERID=UID -e PASSWORD=PASSWORD--restart unless-stopped rocker/verse:3.6.1
```

-d Run container in background and print container ID
-p Publish all exposed ports to random ports (putting rstudio which is on port 8787 by default to 8790 because 8787 is alread in use)
-v Bind mount a volume
-e USER setting variable because "if you are sharing a local volume with the host, any files you create or modify will become owned by root. To avoid this, run interactive terminal sessions with the default user (docker for r-base containers, rstudio for RStudio-derived containers) when sharing volumes."
-e USERID setting vairbale because "On Linux-based hosts, sharing volumes requires that the the UID on the container match the UID on the host, otherwise any files edited or created in the container will be owned by root instead. Check the user id on the host (id) and pass this value to the docker container as an environmental variable, -e USERID=$UID, where $UID is the local user id."
-e PASSWORD setting variable because it is required 
-restart Always restart the container if it stops. except that when the container is stopped (manually or otherwise), it is not restarted even after Docker daemon restarts.


using rocker/verse because "Adds tex & related publishing packages to version-locked tidyverse image" 
assigning tag 3.6.1 because "Users should include the version tag, e.g. rocker/verse:3.3.1 when reproduciblity is paramount," This  "installs all R packages from a fixed snapshot of CRAN at a given date (MRAN repos)."



## Use ENV package for R Package Management
 it is important to replace the standard install.packages command with a command that will return the same packages, regardless of when the Dockerfile is built into an image:
 
 "Using these types of commands ensures the package environment is maintained explicitly and upgraded intentionally, instead of having R packages upgraded as a side effect of an image rebuild (which can be hard to predict, due to the caching involved in image builds)."
 
 
```
# pull in a manifest file and restore it
COPY renv.lock ./
RUN R -e 'renv::restore()'
```


For other projects want to consider costumer managed keys. 

