FROM rocker/tidyverse:3.6.1

RUN Rscript -e "install.packages('argparse')"
RUN Rscript -e "install.packages('rjson')"

# IF YOUR SCRIPT REQUIRES CERTAIN PACKAGES, INSTALL THEM HERE
# RUN Rscript -e "install.packages('some-r-package')"

COPY validate.R /validate.R
COPY score.R /score.R