## Populate the .Rprofile
cat /opt/telostat/Rprofile.R > /etc/R/Rprofile.site

## Install required packages:
/opt/telostat/bin/install.sh rmarkdown vst/sepl

## Copy the web stuff:
cp -R /opt/telostat/www/* /var/www/html/
