#!/bin/bash

sudo yum update -y && sudo yum install git -y && git clone https://github.com/MiltyBrizan/zsh-and-awsmplify-for-amzn-linux-2.git
chmod +x zsh-and-awsmplify-for-amzn-linux-2/envsetup.sh
./envsetup.sh 
