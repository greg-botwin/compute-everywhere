### Notes for creating instance with GPU for fast.ai cours on GCP

## Project Settings
1. Need to have active project set-up with billing and developer api features and SDK installed on local machine
2. Set default region to us-west1 `gcloud config set compute/region us-west1`
3. Set defaul zone to us-west1-a `gcloud config set compute/zone us-west1-b` that has available k80 gpu. 
4. View current configuration settings gcloud config list

## Create VM
1. machine-type: n1-standard-4 (comes with 15GB ram)
2. image-family ubuntu-1604-lts 
3. image-project ubuntu-os-cloud
4. boot-disk-size 100GB
5. accelerator 1,nvidia-tesla-k80  
6. maintenance-policy TERMINATE "When you create an instance with one or more GPUs, you must set the instance to terminate on host maintenance. Instances with GPUs cannot live migrate because they are assigned to specific hardware devices."
7 command `gcloud compute instances create my-fast-ai-comp --machine-type n1-standard-4 --image-family ubuntu-1604-lts --image-project ubuntu-os-cloud --boot-disk-size 100GB --accelerator count=1,type=nvidia-tesla-k80 --maintenance-policy TERMINATE`

## Set-up VM
1. followed this script http://files.fast.ai/setup/paperspace with some modification http://forums.fast.ai/t/lesson-1-using-google-cloud-vm-step-by-step-installation-with-shell-script/7180/3 
2. want to think about making snapshot and image copy and better understanding all the details

