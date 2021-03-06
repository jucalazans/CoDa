% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coda_predict.R
\name{predict.coda}
\alias{predict.coda}
\title{Predict distribution of deaths using CoDa model.}
\usage{
\method{predict}{coda}(object, h, order = NULL, include.drift = NULL,
  method = "ML", ci = c(80, 95), jumpchoice = c("actual", "fit"),
  ...)
}
\arguments{
\item{object}{coda object}

\item{h}{Number of years to be forecast in the future}

\item{order}{A specification of the non-seasonal part of the ARIMA model: 
the three components (p, d, q) are the AR order, the degree of differencing, 
and the MA order. If \code{order = NULL}, the ARIMA order will be estimated 
automatically using the KPPS algorithm.}

\item{include.drift}{Logical. Should the ARIMA model include a linear drift term?
If \code{include.drift = NULL}, the model will be estimated automatically.}

\item{method}{Fitting method: maximum likelihood or minimize conditional 
sum-of-squares. Options to use:
conditional-sum-of-squares (\code{"CSS-ML"}), maximum likelihood (\code{"ML"}) 
and \code{"CSS"}.}

\item{ci}{Confidence level for prediction intervals.}

\item{jumpchoice}{Method used for computation of jumpchoice. 
Possibilities: \code{"actual"} (use actual rates from final year) 
and \code{"fit"} (use fitted rates).}

\item{...}{Additional arguments to be passed to \code{\link[forecast]{Arima}}}
}
\value{
The output is an object of class \code{"predict.coda"} with the components:

\item{call}{An unevaluated function call, that is, an unevaluated 
expression which consists of the named function applied to the given arguments.}

\item{predicted.values}{A list containing the predicted values together
with the associated prediction intervals given by the estimated \code{link{coda}} 
model over the forecast horizon \code{h}.}

\item{kt}{The extrapolated kt parameters.}

\item{conf.intervals}{The extrapolated kt parameters.}

\item{deep}{An object of class \code{ARIMA} that contains all the
components of the fitted time series model used in \code{kt} prediction.}

\item{x}{Vector of ages used in prediction.}

\item{y}{Vector of years used in prediction.}
}
\description{
Predict distribution of deaths using CoDa model.
}
\examples{
# Example 1 ----------------------
# Fit CoDa Mortality Model
M <- coda(CoDa.data)

# Predict life expectancy 20 years in the future using CoDa model
P <- predict(M, h = 20)

# Example 2 ----------------------
# One can specify manually the ARIMA order, a drift to be included or not 
# and the jump choice of the first forecast year.
P2 <- predict(M, h = 20, order = c(0,1,0), include.drift = TRUE, jumpchoice = "fit")

\dontrun{
# Example 3 ----------------------
# Compute life tables using forecast values using the MortalityLaws R package
library(MortalityLaws)
dx <- P$predicted.values$mean
lt <- LifeTable(x = P$x, dx = dx)
}
}
