# R packages used by the Quarto book chapters listed in _quarto.yml.
# This also includes the packages used by Quarto's knitr rendering pipeline.

packages <- c(
  "animation",
  "bestglm",
  "broom",
  "caret",
  "data.table",
  "doParallel",
  "downlit",
  "dplyr",
  "dslabs",
  "emmeans",
  "formatR",
  "gganimate",
  "ggExtra",
  "ggplot2",
  "ggrepel",
  "gifski",
  "gridExtra",
  "gtools",
  "HistData",
  "kableExtra",
  "knitr",
  "Lahman",
  "MASS",
  "matrixStats",
  "pBrackets",
  "RColorBrewer",
  "rafalib",
  "randomForest",
  "rmarkdown",
  "rpart",
  "rvest",
  "scales",
  "stringr",
  "tibble",
  "titanic",
  "tinytex",
  "tidyverse",
  "xml2"
)

missing_packages <- setdiff(packages, rownames(installed.packages()))

if (length(missing_packages)) {
  install.packages(missing_packages, repos = "https://cloud.r-project.org")
} else {
  message("All packages needed to render the book are already installed.")
}

# The PDF format requires a TeX distribution. Preserve an existing TeX
# installation; otherwise install the lightweight TinyTeX distribution.
tex_engines <- Sys.which(c("pdflatex", "xelatex", "lualatex"))

if (!any(nzchar(tex_engines))) {
  message("No TeX installation detected; installing TinyTeX...")
  tinytex::install_tinytex()
} else {
  message("A TeX installation is already available.")
}
