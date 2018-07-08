# compute-everywhere
notes on how to setup GCP

# Project Settings
- Need to have active project set-up with billing and developer api features and SDK installed on local machine
- Set default region to us-west1 `gcloud config set compute/region us-west1`
- Set defaul zone to us-west1-a `gcloud config set compute/zone us-west1-a`
- View current configuration settings `gcloud config list`

# Create VM
- create new VM n1-highmen-8 machine with ubuntu-1804-lts os `gcloud compute instances create my-cloud-comp --image-family ubuntu-1804-lts --image-project ubuntu-os-cloud --machine-type n1-highmem-8` 
