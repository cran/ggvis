% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layer_densities.R
\name{layer_densities}
\alias{layer_densities}
\title{Transformation: density estimate}
\usage{
layer_densities(
  vis,
  ...,
  kernel = "gaussian",
  adjust = 1,
  density_args = list(),
  area = TRUE
)
}
\arguments{
\item{vis}{The visualisation to modify}

\item{...}{Visual properties, passed on to \code{\link{props}}.}

\item{kernel}{Smoothing kernel. See \code{\link{density}} for details.}

\item{adjust}{Multiple the default bandwidth by this amount. Useful for
controlling wiggliness of density.}

\item{density_args}{Other arguments passed on to
\code{\link{compute_density}} and thence to \code{\link{density}}.}

\item{area}{Should there be a shaded region drawn under the curve?}
}
\description{
\code{transform_density} is a data transformation that computes a kernel
density estimate from a dataset. \code{layer_density} combines
\code{transform_density} with \code{mark_path} and \code{mark_area}
to display a smooth line and its standard errror.
}
\examples{
# Basic density estimate
faithful \%>\% ggvis(~waiting) \%>\% layer_densities()
faithful \%>\% ggvis(~waiting) \%>\% layer_densities(area = FALSE)

# Control bandwidth with adjust
faithful \%>\% ggvis(~waiting) \%>\% layer_densities(adjust = .25)
faithful \%>\% ggvis(~waiting) \%>\%
  layer_densities(adjust = input_slider(0.1, 5))

# Control stroke and fill
faithful \%>\% ggvis(~waiting) \%>\%
  layer_densities(stroke := "red", fill := "red")

# With groups
PlantGrowth \%>\% ggvis(~weight, fill = ~group) \%>\% group_by(group) \%>\%
  layer_densities()
PlantGrowth \%>\% ggvis(~weight, stroke = ~group) \%>\% group_by(group) \%>\%
  layer_densities(strokeWidth := 3, area = FALSE)
}
