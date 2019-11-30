# Create an RStudio Enviroment From Dockerfile with Consistent Packages Installed
My goal is to create an enviroment with RStudio for interactive building. 

Once building is complete. I want to be able to replicate the enviroment and deploy consistently. 

I might want to also invesigate workflow tools, to avoid always having to start from scratch. 


This workflow are persona notes and excerpts from the vignette posted at https://environments.rstudio.com/docker

## Launch Container with R Studio



```
 gcloud compute instances create-with-container meta-ibd-cont \
     --container-image rocker/rstudio:3.6.1 \
     --machine-type n1-standard-8 \
```

```
 gcloud compute instances create meta-ibd \
     --machine-type n1-standard-8 
```

     --create-disk image-project=ubuntu-os-cloud,image-family=ubuntu-1804-lts,size=250GB,type=pd-ssd
Note using TAG 3.6.1 to bind to specific version of R


## Use ENV package for R Package Management
 it is important to replace the standard install.packages command with a command that will return the same packages, regardless of when the Dockerfile is built into an image:
 
 "Using these types of commands ensures the package environment is maintained explicitly and upgraded intentionally, instead of having R packages upgraded as a side effect of an image rebuild (which can be hard to predict, due to the caching involved in image builds)."
 
 
```
# pull in a manifest file and restore it
COPY renv.lock ./
RUN R -e 'renv::restore()'
```


For other projects want to consider costumer managed keys. 

