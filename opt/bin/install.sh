#!/bin/bash

## Get package names:
PACKAGES=${@}
R_MIRROR=${R_MIRROR:-"http://cran.r-project.org"}

## If no packages exit:
if [ -z "${PACKAGES}" ]; then
    echo "No package names specified. Exiting..."
    exit 1
fi

## Checks if the input is a file path.
function is_file {
    echo $1 | grep -qE "tar.gz$"
}

## Checks if the input is a github repository.
function is_github {
    echo $1 | grep -qE ".+/.+"
}

## Installs a file.
function install_file {
    R CMD INSTALL $1
}

## Installs a github hosted R package.
function install_github {
    r -e "devtools::install_github(\"$1\")"
}

## Install the R package from CRAN.
function install_cran {
    r -e "install.packages(\"$1\", repos=\"${R_MIRROR}\", quiet=TRUE); library($1)"
}

## Installs the provided package.
function install {
    if is_file $1; then
        echo "File..."
        install_file $1
    elif is_github $1; then
        echo "Github..."
        install_github $1
    else
        echo "CRAN..."
        install_cran $1
    fi
}

## Iterate over packages and install:
for i in ${PACKAGES}; do
    echo "Installing $i"
    install ${i} && echo "Installed $i" || echo "Not Installed $i"
done
