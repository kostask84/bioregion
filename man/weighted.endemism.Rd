% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WeightedEndemism.R
\name{weighted.endemism}
\alias{weighted.endemism}
\title{Measures the distribution of narrow-ranged or endemic species.}
\usage{
weighted.endemism(x)
}
\arguments{
\item{files}{A community matrix or data frame.}
}
\value{
\item{}{A data frame of species traits by site}
}
\description{
\code{weighted.endemism} is species richness inversely weighted
by species ranges.
}
\examples{
require(data.table)
fdir <- system.file("NGAplants", package="bioregion")
files <- file.path(fdir, dir(fdir))
dat <- data.frame(raster2comm(files))
Endm <- weighted.endemism(dat)
}
\references{
\insertRef{Crispetal2001}{bioregion}

\insertRef{LaffanCrisp2003}{bioregion}
}
\keyword{bioregion}
