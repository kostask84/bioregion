% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hotspot.R
\name{hotspots}
\alias{hotspots}
\title{Computes biodiversity hotspots}
\usage{
hotspots(x, values, prob = 2.5, ...)
}
\arguments{
\item{x}{A data frame}

\item{values}{Variable in the dataframe on which to compute hotspots analysis}

\item{prob}{The threshold quantile for representing the highest proportion of biodiversity 
in an area. By default, the threshold is set to \code{prob = 2.5} percent.}

\item{\dots}{Further arguments passed to or from other methods.}
}
\value{
\item{values}{Integers of 1s and 0s with 1 corresponding to the hotspots}
}
\description{
\code{hotspots} map areas or grid cells with highest values for a biodiversity metric e.g. 
species richness, species endemism or degree of threat.
}
\examples{
require(raster); require(colorRamps); require(data.table)

s <- readRDS(system.file("nigeria/NG_comm.rds", package= "bioregion"))
Endm <- weighted.endemism(s)
H <- hotspots(Endm, values = Endm$V1)

## To plot hotspots on the map, first create a polygon shapefile
gr <- readRDS(system.file("nigeria/NG_grids.rds", package= "bioregion"))
m <- merge(gr, H, by="grids")
m <- m[!is.na(m@data$values),]

pol <- readRDS(system.file("nigeria/nigeria.rds", package= "bioregion"))

par(mfrow = c(2,1)); plot(pol, border="grey", col="lightgrey")
plot(m[(m@data$values==1),], col="red", add=TRUE, border=NA)
title("Hotspots of Weighted Endemism", line = 1, cex=1, adj=0.05)

k=10
COLOUR <- blue2green2red(k)
y = choropleth(m, values = m$V1)
 
plot(y, col=COLOUR[y$values], border = NA); 
title("Overall Weighted Endemism", line = 1, cex=1, adj=0.05)
 


}
\references{
\insertRef{myers2000biodiversity}{bioregion}

\insertRef{orme2005global}{bioregion}

\insertRef{Ceballos19374}{bioregion}
}
\seealso{
\code{\link[bioregion]{coldspots}}
}
\author{
Barnabas H. Daru \email{darunabas@gmail.com}
}
\keyword{bioregion}
