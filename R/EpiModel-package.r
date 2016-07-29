
#' Mathematical Modeling of Infectious Disease
#'
#' \tabular{ll}{
#'    Package: \tab EpiModel\cr
#'    Type: \tab Package\cr
#'    Version: \tab 1.2.7\cr
#'    Date: \tab 2015-07-28\cr
#'    License: \tab GPL-3\cr
#'    LazyLoad: \tab yes\cr
#' }
#'
#' @details
#' The EpiModel package provides functions for building, solving, and
#' plotting mathematical models of infectious disease. The goals of the package
#' are to provide basic tools for modeling in multiple frameworks for pedagogical
#' purposes, and to support users in developing and expanding these tools using
#' the package's utility functions for their own research.
#'
#' @section Model Classes and Disease Types:
#' EpiModel currently provides functionality for three classes of epidemic
#' models:
#' \itemize{
#'  \item \strong{Deterministic Compartmental Models:} these continuous-time
#'        models are solved using ordinary differential equations. EpiModel
#'        allows for easy specification of sensitivity models to compare multiple
#'        runs of the same model with different parameter values.
#'  \item \strong{Stochastic Individual Contact Models:} a novel class of
#'        microsimulation models that were developed to mirror the deterministic models
#'        but add random variation in all components of the transmission dynamics
#'        system, from infection to recovery to vital dynamics (births and deaths).
#'  \item \strong{Stochastic Network Models:} using the underlying statistical
#'        framework of dynamic exponential random graph models (ERGMs) recently
#'        developed in the \strong{Statnet} suite of software in R, our network
#'        models simulate partnership formation and dissolution stochastically
#'        according to a user-defined statistical model, as well as disease
#'        spread on that network.
#'  }
#'
#' EpiModel supports three infectious disease types to be run across all
#' of the three classes:
#'  \itemize{
#'   \item \strong{Susceptible-Infectious (SI):} a two-state disease in which
#'         there is life-long infection without recovery. HIV/AIDS is one example,
#'         although for this case it is more common to model infection stages as
#'         separate compartments (forthcoming in a future release).
#'   \item \strong{Susceptible-Infectious-Recovered (SIR):} a three-stage disease
#'         in which one has life-long recovery with immunity after infection.
#'         Measles is one example, but modern models for the disease also require
#'         consideration of vaccination patterns in the population (forthcoming
#'         in a future release).
#'   \item \strong{Susceptible-Infectious-Susceptible (SIS):} a two-stage disease
#'         in which one may transition back and forth from the susceptible to
#'         infected states throughout life. Examples include bacterial sexually
#'         transmitted diseases like gonorrhea.
#'  }
#'
#' @section Model Parameterization and Simulation:
#' EpiModel uses three model setup functions for each model class to input the
#' necessary parameters, initial conditions, and control settings:
#' \itemize{
#'  \item \code{\link{param.dcm}}, \code{\link{param.icm}}, and
#'        \code{\link{param.net}} are used to input epidemic parameters for each
#'        of the three model classes. Parameters include the rate of contacts or
#'        acts between actors, the probability of transmission per contact, and recovery and
#'        demographic rates for models that include those transitions.
#'  \item \code{\link{init.dcm}}, \code{\link{init.icm}}, and \code{\link{init.net}}
#'        are used to input the initial conditions for each class. The main
#'        conditions are limited to the numbers or, if applicable, the specific
#'        agents in the population who are infected or recovered at the simulation
#'        outset.
#'  \item \code{\link{control.dcm}}, \code{\link{control.icm}}, and
#'        \code{\link{control.net}} are used to specify the remaining control
#'        settings for each simulation. The core controls for built-in model
#'        types include the disease type, number of time steps, and number of
#'        simulations. Controls are also used to input new model functions (for
#'        DCMs) and new model modules (for ICMs and network models) to allow the
#'        user to simulate fully original epidemic models in EpiModel. See the
#'        extensive documention linked to on the control function help pages for
#'        further details.
#' }
#'
#' With the models parameterized, the functions for simulating the epidemic
#' model are:
#' \itemize{
#'  \item \code{\link{dcm}} for deterministic compartmental epidemic models.
#'  \item \code{\link{icm}} for individual contact epidemic models.
#'  \item Network models are simulated in a three-step process:
#'  \enumerate{
#'    \item \code{\link{netest}} estimates the statistical models underlying
#'          partnership formation and dissolution. This function is a wrapper
#'          around the \code{ergm} and \code{stergm} functions in the \code{ergm}
#'          and \code{tergm} packages. The current framework for model simulation
#'          is one in which key target statistics guiding the formation formula
#'          from an egocentric sample of the population is passed along with an
#'          estimate of the average duration of edges in the network.
#'    \item \code{\link{netdx}} runs diagnostics on the dynamic model fit by
#'          simulating the base network over time to ensure the model fits the
#'          targets for formation and dissolution.
#'    \item \code{\link{netsim}} simulates the stochastic network epidemic models,
#'          with a given network model fit in \code{\link{netest}}. Here the
#'          function requires this model fit object along with the parameters,
#'          initial conditions, and control settings as defined above.
#'  }
#' }
#'
#' @references The main website is at \url{http://epimodel.org/},
#'             and the source code is at \url{http://github.com/statnet/EpiModel}.
#'             Bug reports and feature requests may be filed there.
#'
#' @name EpiModel-package
#' @aliases EpiModel
#' @import ergm network networkDynamic tergm
#' @importFrom deSolve dede ode
#' @importFrom doParallel registerDoParallel
#' @importFrom foreach foreach "%dopar%"
#' @importFrom RColorBrewer brewer.pal brewer.pal.info
#' @importFrom graphics abline arrows boxplot legend lines mtext par plot points
#'             polygon text title
#' @importFrom grDevices col2rgb colorRampPalette rgb
#' @importFrom stats complete.cases quantile rbinom rgeom sd setNames simulate
#'             supsmu terms.formula update
#' @importFrom utils head tail
#' @importFrom ape as.phylo collapse.singles
#' @importFrom lazyeval lazy_dots lazy_eval
#'
#' @docType package
#' @keywords package
#'
NULL
