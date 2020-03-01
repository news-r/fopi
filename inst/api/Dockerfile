FROM rocker/r-base
MAINTAINER John Coene <jcoenep@gmail.com>

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libxml2-dev \
  libcurl4-gnutls-dev

## RUN R -e 'install.packages(c("devtools"))'
## RUN R -e 'devtools::install_github("trestletech/plumber")'
RUN install2.r plumber remotes
RUN installGithub.r news-r/fopi

EXPOSE 8000
ENTRYPOINT ["R", "-e", "fopi::run_api(commandArgs()[4])"]
CMD ["/usr/local/lib/R/site-library/fopi/api/api.R"]