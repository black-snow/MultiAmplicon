% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/allClasses.R, R/show-methods.R,
%   R/subset-methods.R
\docType{class}
\name{MultiAmplicon-class}
\alias{MultiAmplicon-class}
\alias{MultiAmplicon}
\alias{colnames,MultiAmplicon-method}
\alias{rownames,MultiAmplicon-method}
\alias{ncol,MultiAmplicon-method}
\alias{nrow,MultiAmplicon-method}
\alias{dim,MultiAmplicon-method}
\alias{getRawCounts}
\alias{getStratifiedFilesF}
\alias{getStratifiedFilesR}
\alias{getDerepF}
\alias{getDerepR}
\alias{getDadaF}
\alias{getDadaR}
\alias{getMergers}
\alias{getSequenceTable}
\alias{getSequenceTableNoChime}
\alias{getTaxonTable}
\alias{getSequencesFromTable}
\alias{getSequencesFromTable,MultiAmplicon-method}
\alias{show,MultiAmplicon-method}
\alias{[,MultiAmplicon,index,index,ANY-method}
\alias{[,MultiAmplicon,index,missing,ANY-method}
\alias{[,MultiAmplicon,missing,index,ANY-method}
\alias{[,MultiAmplicon,missing,missing,ANY-method}
\title{The central data structure of the MultiAmplicon package}
\usage{
MultiAmplicon(PrimerPairsSet = PrimerPairsSet(),
  PairedReadFileSet = PairedReadFileSet(), rawCounts = matrix(),
  stratifiedFiles = list(), derep = list(), dada = list(),
  mergers = list(), sequenceTable = list(),
  sequenceTableNoChime = list(), taxonTable = list())

\S4method{colnames}{MultiAmplicon}(x)

\S4method{rownames}{MultiAmplicon}(x)

\S4method{ncol}{MultiAmplicon}(x)

\S4method{nrow}{MultiAmplicon}(x)

\S4method{dim}{MultiAmplicon}(x)

getRawCounts(MA)

getStratifiedFilesF(MA, simplify = TRUE)

getStratifiedFilesR(MA, simplify = TRUE)

getDerepF(MA, simplify = TRUE)

getDerepR(MA, simplify = TRUE)

getDadaF(MA, simplify = TRUE)

getDadaR(MA, simplify = TRUE)

getMergers(MA, simplify = TRUE)

getSequenceTable(MA, simplify = TRUE)

getSequenceTableNoChime(MA, simplify = TRUE)

getTaxonTable(MA, simplify = TRUE)

getSequencesFromTable(MA)

\S4method{getSequencesFromTable}{MultiAmplicon}(MA)

\S4method{show}{MultiAmplicon}(object)

\S4method{[}{MultiAmplicon,index,index,ANY}(x, i, j, ..., drop = FALSE)

\S4method{[}{MultiAmplicon,index,missing,ANY}(x, i, j, ..., drop = FALSE)

\S4method{[}{MultiAmplicon,missing,index,ANY}(x, i, j, ..., drop = FALSE)

\S4method{[}{MultiAmplicon,missing,missing,ANY}(x, i, j, ...,
  drop = FALSE)
}
\arguments{
\item{PrimerPairsSet}{a set of primer pairs specifiying your
amplicons see \code{\link{PrimerPairsSet-class}}}

\item{PairedReadFileSet}{a set of paired end sequencing data files
\code{\link{PairedReadFileSet-class}}}

\item{rawCounts}{Users should not supply this parameter, the slot
is created by \code{\link{sortAmplicons}}.}

\item{stratifiedFiles}{Users should not supply this parameter, the
slot is created by \code{\link{sortAmplicons}}.}

\item{derep}{Users should not supply this parameter, the slot is
created by \code{\link{derepMulti}}}

\item{dada}{Users should not supply this parameter, the slot is
created by \code{\link{dadaMulti}}}

\item{mergers}{Users should not supply this parameter, the slot is
created by \code{\link{mergeMulti}}}

\item{sequenceTable}{Users should not supply this parameter, the
slot is created by \code{\link{makeSequenceTableMulti}}}

\item{sequenceTableNoChime}{Users should not supply this parameter,
the slot is created by \code{\link{removeChimeraMulti}}}

\item{taxonTable}{Users should not supply this parameter,
the slot is created by \code{\link{getBlastTaxAnnot}}}

\item{x}{MultiAmplicon-class object}

\item{MA}{MultiAmplicon-class object}

\item{simplify}{Should a list of objects be simplified to only one
object if it has length one?}

\item{object}{A \code{MultiAmplicon-class} object.}

\item{i}{numeric, logical or names vector for subsetting rows (==
amplicons)}

\item{j}{numeric, logical or names vector for subsetting columns
(== read files, corresponding usually to samples)}

\item{...}{not used}

\item{drop}{should not be used}
}
\description{
The MultiAmplicon class is a container that stores at least primer
pairs, read files and progressively processed data in an 'amplicon
x samples' format. The slots in this object are incrementally
filled with by running wrappers functions (mostly around functions
from the \code{dada2} package).

Subsetting for MultiAmplicon objects should conveniently subset
all (potentially) filled slots
}
\section{Functions}{
\itemize{
\item \code{MultiAmplicon}: Constructor for
MultiAmplicon-class
}}

\section{Slots}{

\describe{
\item{\code{PrimerPairsSet}}{The primer pairs used in your experiment to
specify amplicons stored in a
\code{\link{PrimerPairsSet-class}} object.}

\item{\code{PairedReadFileSet}}{The (quality filtered) fastq files (one
file pair for each sample) that store your sequencing data.}

\item{\code{rawCounts}}{A numeric matrix of sequencing read counts per
amplicon and sample. Created by the function
\code{\link{sortAmplicons}}}

\item{\code{stratifiedFiles}}{temporary files as a result of stratifying
into amplicons and samples using the function
\code{\link{sortAmplicons}}. Forward (sometimes called R1) and
reverse (sometimes called R2) files are stored as a (amplicons
x samples) matrix of \code{\link{PairedReadFileSet-class}}
objects.}

\item{\code{derep}}{A \code{\link{PairedDerep-class}} object containing
pairs of derep-class objects created by \code{dada2}’s
\code{\link[dada2]{derepFastq}} function}

\item{\code{dada}}{A \code{\link{PairedDada-class}} object containing
pairs of dada-class objects created by \code{dada2}’s
\code{\link[dada2]{dada}} function}

\item{\code{mergers}}{}

\item{\code{sequenceTable}}{}

\item{\code{sequenceTableNoChime}}{}

\item{\code{taxonTable}}{MultiAmplicon(PrimerPairsSet, PairedReadFileSet)}
}}

\examples{

primerF <- c("AGAGTTTGATCCTGGCTCAG", "ACTCCTACGGGAGGCAGC",
            "GAATTGACGGAAGGGCACC", "YGGTGRTGCATGGCCGYT")
primerR <- c("CTGCWGCCNCCCGTAGG", "GACTACHVGGGTATCTAATCC",
             "AAGGGCATCACAGACCTGTTAT", "TCCTTCTGCAGGTTCACCTAC")

PPS <- PrimerPairsSet(primerF, primerR)

fastq.dir <- system.file("extdata", "fastq", package = "MultiAmplicon")
fastq.files <- list.files(fastq.dir, full.names=TRUE)
Ffastq.file <- fastq.files[grepl("F_filt", fastq.files)]
Rfastq.file <- fastq.files[grepl("R_filt", fastq.files)]

PRF <- PairedReadFileSet(Ffastq.file, Rfastq.file)

MA <- MultiAmplicon(PPS, PRF)

## the number of amplicons (primer pairs)
nrow(MA)

## the number of samples (sequencing read file pairs)
ncol(MA)

## sort into amplicons
MA1 <- sortAmplicons(MA, filedir=tempfile(pattern = "dir"))

MA2 <- derepMulti(MA1)

MA3 <- dadaMulti(MA2, selfConsist = TRUE)

MA4 <- mergeMulti(MA3, justConcatenate=TRUE)

MA5 <- makeSequenceTableMulti(MA4)

MA6 <- removeChimeraMulti(MA5, mc.cores=1)

MA7 <- getBlastTaxAnnot(MA6)

}
\seealso{
\code{\link[dada2]{derepFastq}},\code{\link[dada2]{dada}}
}
\author{
Emanuel Heitlinger
}
