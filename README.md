This package constitutes an interactive R problem set based on the RTutor package (https://github.com/skranz/RTutor). 

The problem set "Impacts of genetically modified crops - An interactive analysis with R" examines the main method of the economic paper  "National and Global Impacts of Genetically Modified Crops" by Casper Worm Hansen and Asger Mose Wingender (2023). The user works on descriptive tasks as well as regressions and replicates the authors' results in the final chapter. The original paper can be found here: https://www.aeaweb.org/articles?id=10.1257/aeri.20220144. The data and stata code to this paper can be found here: https://www.openicpsr.org/openicpsr/project/178041/version/V1/view.

## 1. Installation

RTutor and this package is hosted on Github. To install everything, run the following code in your R console.
```s
install.packages("RTutor",repos = c("https://skranz-repo.github.io/drat/",getOption("repos")))

if (!require(devtools))
  install.packages("devtools")

devtools::install_github("DariaPalitzsch/RTutorImpactsGMCrops")
```

## 2. Show and work on the problem set
To start the problem set first create a working directory in which files like the data sets and your solution will be stored. Then adapt and run the following code.
```s
library(RTutorImpactsGMCrops)

# Adapt your working directory to an existing folder
setwd("C:/problemsets/RTutorImpactsGMCrops")
# Adapt your user name
run.ps(user.name="Jon Doe", package="RTutorImpactsGMCrops",
       auto.save.code=TRUE, clear.user=FALSE)
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.
