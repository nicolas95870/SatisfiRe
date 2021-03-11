
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SatisfiRe

<!-- badges: start -->
<!-- badges: end -->

The goal of SatisfiRe is to analyse data from consumers survey

## Installation

You can install the released version of SatisfiRe from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("SatisfiRe")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("nicolas95870/SatisfiRe")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(SatisfiRe)
## basic example code
```

## Compute NPS

``` r
NPS(c(1,10,2,3,5,2))
#> [1] -66.67
```

## Display NPS

``` r
NPS_Dognuts(c(1,2,10,4,3,6,7,8))
#> PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

<div id="htmlwidget-f6c827bd7937d538717f" style="width:100%;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-f6c827bd7937d538717f">{"x":{"visdat":{"27ab465f8451":["function () ","plotlyVisDat"]},"cur_data":"27ab465f8451","attrs":{"27ab465f8451":{"labels":{},"values":{},"marker":{"colors":["#4e9c34","#fbb829","#bd3131"]},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"pie","hole":0.6,"inherit":true}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Repartition du NPS","showlegend":false,"xaxis":{"showgrid":false,"zeroline":false,"showticklabels":false},"yaxis":{"showgrid":false,"zeroline":false,"showticklabels":false},"annotations":[{"text":-50,"x":0.5,"y":0.5,"xref":"paper","yref":"paper","showarrow":false,"font":{"color":"black","family":"sans serif","size":30}},{"text":-50,"x":0.5,"y":0.5,"xref":"paper","yref":"paper","showarrow":false,"font":{"color":"black","family":"sans serif","size":30}},{"text":-50,"x":0.5,"y":0.5,"xref":"paper","yref":"paper","showarrow":false,"font":{"color":"black","family":"sans serif","size":30}}],"hovermode":"closest"},"source":"A","config":{"showSendToCloud":false},"data":[{"labels":["promoteurs","neutres","detracteurs"],"values":[1,2,5],"marker":{"color":"rgba(31,119,180,1)","colors":["#4e9c34","#fbb829","#bd3131"],"line":{"color":"rgba(255,255,255,1)"}},"type":"pie","hole":0.6,"frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
