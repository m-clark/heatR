# heatR

![travis](https://travis-ci.org/m-clark/heatR.svg?branch=master)
[![codecov](https://codecov.io/gh/m-clark/heatR/branch/master/graph/badge.svg)](https://codecov.io/gh/m-clark/heatR)
[![Project Status: Moved to http://github.com/m-clark/visibly – The project has been moved to a new location, and the version at that location should be considered authoritative.](https://www.repostatus.org/badges/latest/moved.svg)](https://www.repostatus.org/#moved) to [http://github.com/m-clark/visibly](http://github.com/m-clark/visibly)


#### Visualizing correlation matrix structure

"Don't let yourself get attached to anything you are not willing to walk out on in 30 seconds flat if you feel the **heat** around the corner." ~ Neil McCauley

This package is now deprecated.  However, the primary function has been incorporated into [visibly](https://m-clark.github.io/visibly) and improved, so check it out over there.


To install:

```r
devtools::install_github('m-clark/heatR')
```

To use:

```r
library(heatR)
data(bfi)
cormat = cor(bfi, use='pair')
corrheat(cormat, psychOptions = list(fm='ml', rotate='promax'))
```
![](bfi.png)


