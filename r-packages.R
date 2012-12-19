site<-"http://mirror.bjtu.edu.cn/cran/"

oneplus.packages<-c("BGSIMD",
                    "ggplot2",
                    "tm",
                    "arm",
                    "plyr",
                    "scatterplot3d",
                    "lubridate",
                    "RCurl",
                    "XML")

for(package in oneplus.packages) {
    if (!require(package)) {
        install.packages(package, repo=site, dependencies=TRUE)
    }
}

