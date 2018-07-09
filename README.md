# compute-everywhere
notes on how to setup GCP

# Project Settings
1. Need to have active project set-up with billing and developer api features and SDK installed on local machine
2. Set default region to us-west1 `gcloud config set compute/region us-west1`
3. Set defaul zone to us-west1-a `gcloud config set compute/zone us-west1-a`
4. View current configuration settings `gcloud config list`

# Create VM
1. create new VM n1-highmen-8 machine with ubuntu-1804-lts os `gcloud compute instances create my-cloud-comp --image-family ubuntu-1804-lts --image-project ubuntu-os-cloud --machine-type n1-highmem-8` 

# Set Network Tag to work with RStudio 
1. `firewall-rules create "rstudio-tcp-rule" --allow tcp:8787 --source-ranges="[home-ip-address]" --description="Allow port 8787 access from mome IP address`

# Connect to VM and Set Password and Install R and Rstudio Server
1. SSH to VM using gcloud `gcloud compute ssh my-cloud-compute`
2. set a pasword for default user `sudo passwd`
3. install R using the instructions available at <https://cran.r-project.org/>
- create a backup a configuration file like before you edit it `sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup`
- The Ubuntu archives on CRAN are signed with the key of “Michael Rutter marutter@gmail.com” with key ID E084DAB9. To add the key to your system with one command use `sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9`
- Add cran to source file `sudo add-apt-repository "deb https://cran.cnr.berkeley.edu/bin/linux/ubuntu bionic-cran35/"`
- To install the complete R system `sudo apt-get update` followed by `sudo apt-get install r-base` and `sudo apt-get install r-base-dev` and `sudo apt autoremove` to clean
- Install gdebi which can be used to install RStudio and all of its dependencies `sudo apt-get install gdebi-core` and then `sudo gdebi rstudio-server-1.1.453-amd64.deb`
- Install other package dependencies `sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev` and `sudo apt install libgeos-dev libproj-dev libgdal-dev libudunits2-dev`

# Connect to RStudio Server
1. Get externap IP address `gcloud compute instances list`
2. In web browser http://<external-ip>:8787
3. Sign in with the username and passwrod you created for your account
