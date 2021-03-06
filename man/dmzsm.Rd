\name{dmzsm}
\alias{dmzsm}
\alias{pmzsm}
\alias{qmzsm}
\alias{rmzsm}
\title{Metacommunity zero-sum multinomial distribution}

\description{
  Density, distribution, quantile function and random generation
  for Alonso & McKane's mZSM distribution with parameter \code{theta}.
}

\usage{
dmzsm(x, J, theta, log = FALSE)
pmzsm(q, J, theta, lower.tail=TRUE, log.p=FALSE)
qmzsm(p, J, theta, lower.tail = TRUE, log.p = FALSE)
rmzsm(n, J, theta)
}

\arguments{
  \item{x}{
    vector of (non-negative integer) quantiles. In the context of
    species abundance distributions, this is a
    vector of abundance of species in a sample.
  }
  \item{q}{vector of (non-negative integer) quantiles. In the context of
    species abundance distributions, a vector of abundance of species in a sample.
  }
  \item{n}{number of random values to return.}
   \item{p}{
     vector of probabilities.
   }
  \item{J}{
    positive integer 0 < J < Inf, sample size.  In the context of
    species abundance distributions, usually the number of individuals in a sample.
  }
  \item{theta}{
    positive real theta > 0; Hubbell's \sQuote{fundamental biodiversity number}
  }
  \item{log, log.p}{
    logical; if TRUE, probabilities p are given as log(p).
  }
  \item{lower.tail}{
    logical; if TRUE (default), probabilities are P[X <= x],
    otherwise, P[X > x].
  }
}

\details{
  The metacommunity Zero-sum multinomial distribution
  (mZSM)
  describes the probabilities
  of abundances (population sizes)
  in a random sample of size J taken from a
  collection 
  of populations (the metacommunity).
  The total number of individuals in the metacommunity is fixed (zero-sum assumption).
  The populations in the metacommunity undergo a stochastic
  birth-death-immigration process,
  with equal demographic rates (neutrality or ecological
  equivalence assumption, Hubbell 2001).
  Alonso and McKane (2004) proposed an approximation for the density
  function for a large Poisson sample (J>100):

  \deqn{p(x) = \frac{N(x)}{\sum_1^S N(x)}}{p(x) = N(x)/(sum(from 1 to S) N(x))}

  where S is the number of populations in the sample, and
  N(x) is the expected number of sampled populations of size x :
  
  \deqn{N(x) = \frac{\theta}{x (1 - x/J)^{\theta -1}}}{N(x) = theta/x (1 - x/J)^(theta -1)}
  
  Therefore, the mZSM 
  is a model for species
  abundances distributions (SAD)
  in a sample taken from a community under
  the assumptions that (a) species
  abundances in the community follows the stationary distribution
  of a neutral, zero-sum stochastic process of birth, death and speciation (or migration);
  (b) sampling is a Poisson process with expected
  value well approximated by N(x), (c) individuals are sampled with replacement, or the
  fraction of total individuals sampled is small enough to approximate a
  sample with replacement.
}

\value{
  
\code{dmzsm} gives the (log) density function, \code{pmzsm} gives the (log)
distribution function, and \code{qmzsm} gives the quantile function.

Invalid values for parameters \code{J} or \code{theta} will result in return
values \code{NaN}, with a warning.
}

\references{
  
  Alonso, D. and McKane, A.J.  2004.  Sampling Hubbell's neutral
  model of biodiversity. \emph{Ecology Letters 7}:901-910.

  Hubbell, S.P.  2001.  \emph{The Unified Neutral Theory of Biodiversity}.
  Princeton University Press.
}

\author{Paulo I Prado \email{prado@ib.usp.br}, Murilo Dantas Miranda and Andre Chalom}

\seealso{
  \code{\link{fitmzsm}} for maximum likelihood estimation;
  \code{alonso.eqn12}
  in package \pkg{untb} which is based on the exact formulation of mZSM.
}

\examples{
## Alonso & McKanne (2004) figure 2
data(moths) #Fisher's moths data
m.tab <- hist(moths, breaks = 2^(0:12), plot = FALSE)
plot(m.tab$density~m.tab$mids, log="xy",
     xlab = "Abundance", ylab = "Probability density",
     ylim=c(1e-7,1))
X <- 1:max(moths)
Y <- dmzsm(X, J = sum(moths), theta = 39.8)
lines(Y ~ X)
}
