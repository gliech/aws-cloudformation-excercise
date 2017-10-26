#!/bin/bash

if [[ $# -ne 1 ]]
then
    echo 'Need exactly 1 argument as new version name' 1>&2
    exit 1
fi

if [[ ! -f ./latest.tar.gz ]]
then
    wget https://wordpress.org/latest.tar.gz || exit 2
fi

if [[ -d ./wordpress ]]
then
    echo 'Wordpress directory already exists. Please remove manually' 1>&2
    exit 3
fi

if [[ ! -d ./wordpress.configs ]]
then
    echo 'Please put your AWS Elastic Beanstalk configuration into a directory with the name wordpress.configs' 1>&2
    exit 4
fi


{
    tar -xvzf ./latest.tar.gz wordpress &&
    cp -r ./wordpress.configs/* ./wordpress &&
    cd ./wordpress &&
    zip ../wordpress-${1}.zip -r ./* ./.[^.]* &&
    cd .. &&
    rm -r ./wordpress
} || {
    if [[ -d ./wordpress ]]
    then
        rm -rf ./wordpress
    fi
    exit 5
}
