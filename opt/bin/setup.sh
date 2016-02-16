## Populate the .Rprofile
cat /opt/telostat/Rprofile.R > /etc/R/Rprofile.site

## Install required packages:
/opt/telostat/bin/install.sh vst/sepl rmarkdown dplyr lubridate ggplot2 zoo xts data.table httr

## Copy the web stuff:
cp -R /opt/telostat/www/* /var/www/html/
