
FROM rocker/verse:latest

## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
libxml2-dev \
libcairo2-dev \
libsqlite3-dev \
libmariadbd-dev \
libpq-dev \
libssh2-1-dev \
unixodbc-dev \
libcurl4-openssl-dev \
libssl-dev

## copy files
COPY iris_script.R /iris_script.R

## install packages 
RUN R -e "install.packages(c('tidyverse','AzureStor'),repos = 'http://cran.us.r-project.org')"

CMD R -e "source('/iris_script.R')"

# docker command 1: docker run -it --rm -v ~/data:/data -v ~/iris/output:/output irisimage
# docker command 2: docker run -it --rm -v /Users/peerchristensen/Desktop/Projects/iris_docker/data:/data -v /Users/peerchristensen/Desktop/Projects/iris_docker/output:/output irisimage
