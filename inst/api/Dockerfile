FROM rocker/r-base
MAINTAINER John Coene <jcoenep@gmail.com>

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libxml2-dev \
  libcurl4-gnutls-dev

RUN install2.r plumber remotes
RUN R -e 'remotes::install_github("news-r/fopi")'

EXPOSE 8000
ENTRYPOINT ["R", "-e", "fopi::run_api(commandArgs()[4], 8000)"]
CMD ["0.0.0.0"]