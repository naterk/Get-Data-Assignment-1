##
##  Getting and Cleaning Data
##  Assignment 1
##
##  Description
##      Downloads the Human Activity Recognition smartphone data sets, combines
##      the data sets, and creates two sets of tidy data.  The first set extracts
##      mean and standard deviation features from the consolidated data.  The
##      second set summarizes the data from the first.  Details on the tidy data
##      sets can be found in the GitHub repo listed below in the file "Codebook.md"
##      More details on the working of this script can be found in the file
##      "README.md" in the same GitHub Repository.
##
##  Repo
##      https://github.com/naterk/Get-Data-Assign-1
##
##  Usage
##      source("run_analysis.R")
##      generateDatasets()
##
##  Results
##      Script execution will download and extract the source data from the
##      University of California, Irvine; assemble the raw data; create the
##      two tidy data sets; and save the tidy data sets to disk.
##
library(tools)
library(reshape2)
library(plyr)

##
##  Function
##      generateDataSets(force=FALSE)  [Main Function]
##
##  Arguments
##      force
##          By default, the generateDataSets() function does not download
##          and extract the source data if it is already present locally.  By
##          setting force to TRUE, the caller can override the default behavior
##          and force the source data to be downloaded again.  The default is
##          FALSE.
##
##  Returns
##      Nothing
##
##  Description
##      The generateDataSets() function accomplishes all tasks necessary to
##      retrieve the raw data, create the tidy data sets, and save the results
##      to disk.  Specifically, the function:
##
##          1.  Gets and extracts the raw data files from the UCI website.
##          2.  Assembles the source files into a single, raw data set.
##          3.  Generates the required tidy data sets and saves them to disk.
##
generateDataSets <- function(force=FALSE) {
    getDataFiles(force)
    raw.data <- assembleRawData()
    generateTidyData(raw.data)
}

##
##  Function
##      getDataFiles(force=FALSE)
##
##  Arguments
##      force
##          If set to TRUE causes getDataFiles() to download and re-extract
##          the source files, even if they already exist on the local machine.
##          If set to FALSE, the function will not download the source files
##          if they are already present in the requisite directory.
##
##  Returns
##      Nothing.
##
##  Description
##      The getDataFiles() function performs the following actions:
##
##          1.  If necessary, creates a directory to hold the raw source files.
##          2.  Downloads the compressed source material from the specified
##              site.  By default, this step is skipped if the source material
##              is already present.  Setting 'force' to TRUE will override this
##              default behavior and forces the download to occur.
##          3.  Appends an entry to a log file.  The entry includes the time
##              that the download occurred, an md5 checksum of the source data
##              file, and the URL from which the data was downloaded.
##          4.  Uncompresses the source data file into the appropriate directory.
##

getDataFiles <- function(force = FALSE) {
    
    ##
    ##  Define source material URL, local directories, and local filenames.
    ##
    raw.data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    data.dir     <- "./data-raw"
    raw.data.zip <- "./data-raw/UCI HAR Dataset.zip"
    raw.data.dir <- "./data-raw/UCI HAR Dataset"
    log.file.fn  <- "./data-raw/UCI HAR Dataset.log"
    
    ##
    ##  If one is required, create a directory to store the raw data.
    ##
    if (!file.exists(data.dir)) {
        dir.create(data.dir)
    }
    
    ##
    ##  If it is not already present, download the source zip file.  If
    ##  force is equal to TRUE, download the zip file regardless.  If the
    ##  download fails, display an error message and halt the script.
    ##
    if (force | !file.exists(raw.data.zip)) {
        if(download.file(url=raw.data.url, destfile=raw.data.zip, method="curl", quiet=TRUE)) {
            stop("Unable to downlaod source data zip file")
        }
        
        ##
        ##  Create a log entry including a timetamp, the md5 checksum of the
        ##  zip file, and the source URL.  Append the log entry to the specified
        ##  log file.
        ##
        log.entry <- data.frame(Sys.time(), md5sum(raw.data.zip), raw.data.url)
        write.table(log.entry, file=log.file.fn, append=TRUE, row.names=FALSE, col.names=FALSE)
        
        ##
        ##  Unzip the source data into the raw data directory
        ##
        unzip(zipfile=raw.data.zip, exdir=data.dir)
    }
    
}

##
##  Function
##      assembleRawData()
##
##  Arguments
##      None
##
##  Returns
##      A cleaned-up data frame containing the subject, activity, and all
##      feature measurements for each event in the 'test' and 'train' data
##      sets.
##
##  Description
##      The assembleRawData() function calls getRawData() to construct a
##      cleaned-up version of the 'test' and 'train' data, and then combines
##      them into a single data.frame. The assembled data frame is
##      returned to the caller.
##
assembleRawData <- function() {
    rbind(getRawData("test"), getRawData("train"))
}

##
##  Function
##      generateTidyData(raw.data)
##
##  Arguments
##      raw.data
##          A data.frame containing the cleaned-up source data that is the
##          basis for the tidy data.
##
##  Returns
##      Nothing
##
##  Description
##      The generateTidyData() function creates two separate tidy data sets
##      from the raw data provided by the caller.  The first tidy data set
##      is an extract of the subject, activity, and all mean and standard
##      deviation measurements.  The second tidy data set is the average of
##      all measurements (summarized by activity and subject).  Two versions
##      of the second tidy data set are created.  The first is in 'wide' format
##      and contains:
##
##          activity, subject, measure 1, measure 2, measure 3, etc.
##
##      The second version is in 'long' format and contains:
##
##          activity, subject, feature name, measurement value
##
##      All data sets and versions are written to local files in a format
##      allowing them to be read with read.table().
##

generateTidyData <- function(raw.data) {
    
    ##
    ##  Define destination directory and filenames for the tidy data
    ##
    tidy.dir        <- "./data-tidy"
    tidy1.fn        <- "./data-tidy/tidy1.txt"
    tidy2.wide.fn   <- "./data-tidy/tidy2wide.txt"
    tidy2.long.fn   <- "./data-tidy/tidy2long.txt"
    
    ##
    ##  Generate the first tidy data set, and then use it to generate
    ##  'wide' and 'long' versions of the second tidy data set.
    ##
    tidy1.data      <- createTidy1(raw.data)
    tidy2.wide.data <- createTidy2(tidy1.data, tidy.type="wide")
    tidy2.long.data <- createTidy2(tidy1.data, tidy.type="long")
    
    ##
    ##  If it doesn't already exist, create a directory to store the
    ##  tidy data sets.
    ##
    if (!file.exists(tidy.dir)) {
        dir.create(tidy.dir)
    }
    
    ##
    ##  Write all data sets to local files.  Suppress row names to
    ##  make the data easier to read in a browser.
    ##
    write.table(tidy1.data,      file=tidy1.fn,      row.names=FALSE)
    write.table(tidy2.wide.data, file=tidy2.wide.fn, row.names=FALSE)
    write.table(tidy2.long.data, file=tidy2.long.fn, row.names=FALSE)
}

##
##  Function
##      getRawData(data.set)
##
##  Arguments
##      data.set
##          A string specifying which raw data set to create.  Valid options
##          are "test" and "train".  There is no default.
##
##  Returns
##      A data frame that consolidates the subject, activity, and feature
##      measurements from the caller specified source data set.
##
##  Description
##      The getRawData() function consolidates subject, activity, and feature
##      measurements for either the "test" or "train" data sets.  Actions
##      performed by the script include:
##
##          1.  Validate the caller supplied data set name.
##          2.  Generate the path to the source files for the specific data set.
##          3.  Read the activity, subject, and feature files.
##          4.  Consolidate the data into a single data frame.
##          5.  Assign human readable and R-compliant column names.
##          6.  Append a column identifying which data set was used.
##          7.  Convert activities to human readable factors.
##          8.  Return the cleaned-up raw data to the caller.
##

getRawData <- function(data.set) {

    ##
    ##  Verify that the caller asked for a valid source data set.
    ##  If not, display an error message and halt the script.
    ##
    if (!(data.set %in% c("test", "train"))) {
        stop("Requested data set not found")
    }
    
    ##
    ##  Set the path for the subject, activity, and feature date
    ##  source files for the caller supplied data set.
    ##
    if (data.set == "test") {
        fn.subject   <- "./data-raw/UCI HAR Dataset/test/subject_test.txt"
        fn.activity  <- "./data-raw/UCI HAR Dataset/test/y_test.txt"
        fn.features  <- "./data-raw/UCI HAR Dataset/test/X_test.txt"
    } else {
        fn.subject   <- "./data-raw/UCI HAR Dataset/train/subject_train.txt"
        fn.activity  <- "./data-raw/UCI HAR Dataset/train/y_train.txt"
        fn.features  <- "./data-raw/UCI HAR Dataset/train/X_train.txt"
    }
        
    ##
    ##  Read the subject, activity, and feature data.  The source data
    ##  is organized such that the first line of the subject file is
    ##  associated with the first line of the activity and feature files.
    ##  Combine the subject, activity, and feature data into a single data
    ##  frame and assign column names.  Add a column that identifies
    ##  which raw data set (train or test) was used as source material.
    ##
    raw.subject               <- read.table(fn.subject)
    raw.activity              <- read.table(fn.activity)
    raw.features              <- read.table(fn.features)
    raw.data                  <- cbind(raw.subject, raw.activity, raw.features)
    names(raw.data)           <- generateColumnNames()
    raw.data$DataSet          <- data.set

    ##
    ##  Convert the activity data from integers to human readable factors
    ##
    activity.factors          <- c("Walking","WalkingUpstairs","WalkingDownstairs","Sitting","Standing","Laying")
    raw.data$activity         <- factor(raw.data$activity)
    levels(raw.data$activity) <- activity.factors
    
    ##
    ##  Return the raw data to the caller
    ##
    raw.data
}

##
##  Function
##      createTidy1(raw.data)
##
##  Arguments
##      raw.data
##          A data frame containing the consolidated raw data for the 'test' and
##          'train' data sets.  The data set contains the subject, activity,
##          measurements, and data set identifier.
##
##  Returns
##      A tidy data sets consisting of the subject, activity, mean measurements
##      and standard deviation measurements.
##
##  Description
##      The createTidy1() function returns the required columns of the specified
##      data set by matching patterns against the list of column names.  Regular
##      expressions are used to identify:
##
##          Subject identifier
##              Selects the column whose name is 'subject'
##          Activity type
##              Selects the column whose name is 'activity'
##          Mean measurement data
##              Selects all columns ending in the string '.Mean'.  In the original
##              data, these columns contained the string 'mean()', which is not a
##              legal R column name.  [See the function generateColumnNames for more
##              details.]  The project instructions were unclear whether the 'meanFreq'
##              measurements should be included in the tidy data set.  Since they are
##              weighted averages and since they were not paired with standard deviation
##              measurements, I opted to exclude them.
##          Standard deviation data
##              Selects all columns ending in the string '.StdDev'.  In the original
##              data, these columns contained the string 'std().
##
##      The function performs the following actions:
##
##          1.  Extract the column names from the cleaned-up raw data.
##          2.  Determine the column numbers that match the above patterns
##          3.  Create a single, ordered list of matching column numbers,
##              removing any duplicates (there should be none).
##          4.  Subset the raw data, returning the identified columns to the caller.
##

createTidy1 <- function(raw.data) {

    ##
    ## Retrieve the column names from the cleaned-up raw data set.
    ##
    col.names <- names(raw.data)

    ##
    ##  Identify the column numbers that whose names are the strings 'subject'
    ##  or 'activity' or that end in '.Mean' or '.StdDev'.
    ##
    select.1  <- grep("^subject$"  , col.names, ignore.case=FALSE)
    select.2  <- grep("^activity$" , col.names, ignore.case=FALSE)
    select.3  <- grep("\\.Mean$"   , col.names, ignore.case=FALSE)
    select.4  <- grep("\\.StdDev$" , col.names, ignore.case=FALSE)
    
    ##
    ##  Build a single list of selected columns, sorting the column
    ##  numbers to preserve column order and removing any duplicates.
    ##
    selects   <- c(select.1, select.2, select.3, select.4)
    selects   <- unique(sort(selects))
    
    ##
    ##  Subset the raw data, extracting only the columns identified
    ##  above.  Return the subsetted data to the caller.
    ##
    raw.data[,selects]
}

##
##  Function
##      createTidy2(data.set,tidy.type)
##
##  Arguments
##      data.set
##          A data frame that contains an 'activity' and 'subject' column in
##          addition to a series of measurements.  Typically this is the
##          data.set returned from createTidy1().
##      tidy.type
##          A character string specifying whether the summary, tidy data set
##          should be 'wide' or 'long' (see below).  The default is 'wide'.
##
##  Returns
##      A tidy data set consisting of the average of each measurement summarized
##      by activity and subject.  The returned data frame can be either 'wide' or
##      'long' depending on the tidy.type parameter.
##
##  Description
##      The createTidy2() function produces a data set containing the average of
##      each feature measurement for each activity and subject.  The tidy.type
##      argument specifies whether the produced data set is either 'wide' or
##      'long'.  When 'wide' is selected, the data is formatted as:
##
##          activity, subject, measurement-1, measurement-2, measurement-3, etc.
##
##      When 'long' is selected, the data is organized as:
##
##          activity, subject, measurement-name, measurement-value
##
##      The function performs the following actions:
##
##          1.  Verify the caller supplied format type.
##          2.  Use ddply() to group the data by activity and subject.  Use
##              numcolwise() to compute the mean for each grouping.  This is
##              the 'wide' data set.
##          3.  If the 'long' format is requested, use melt() to create a separate
##              row for each feature type.  The melt() function is applied to the
##              'wide' format data set which already includes the means.
##          4.  Provide human readable column names for the 'long' format.
##          5.  Return the tidy data set to the caller.
##

createTidy2 <- function(data.set,tidy.type="wide") {

    ##
    ##  Verify that the caller specified either a 'wide' or 'long'
    ##  format for the output.  If neither was specified, then display
    ##  an error message and halt the script.
    ##
    if (!(tidy.type %in% c("wide", "long"))) {
        stop("Requested tidy format not found")
    }
    
    ##
    ##  Generate the 'wide' format.  It will be converted to 'long'
    ##  later if required.  Group the data by activity and subject and
    ##  use ddply to compute the mean value for all remvining columns in
    ##  the data set.
    ##
    group.by  <- c("activity", "subject")
    tidy2.dat <- ddply(data.set, group.by, numcolwise(mean))
    
    ##
    ##  If the caller specified the 'long' format, use the melt function
    ##  to fold the measurement columns, creating one measurement per
    ##  data record.  This assumes that activity and subject are in the
    ##  first two columns.  Measurements are in columns 3 through the
    ##  maximum column dimensions.  Add meaningful column names.
    ##
    if (tidy.type == "long") {
        meas.vars        <- names(tidy2.dat[,3:dim(tidy2.dat)[2]])
        tidy2.dat        <- melt(tidy2.dat,id=group.by,measure.vars=meas.vars)
        names(tidy2.dat) <- c("activity","subject","measurement.Name","measurement.Mean")
    }
    
    ##
    ##  Return the tidy data.set
    ##
    tidy2.dat
}

##
##  Function
##      generateColumnNames()
##
##  Arguments
##      None
##
##  Returns
##      A list of strings containing human readable and R-compliant names for
##      all columns in the aggregated raw data set.
##
##  Description
##      The generateColumns() function will produce a list of column names for the
##      newly aggregated raw data set.  These names are based on the feature measurement
##      names contained in the features.txt file supplied with the source data.
##      These names are modified to correct typographical errors in the source
##      data, expanded to make them more easily understood by a human reviewer,
##      and edited to ensure that the new names are R-compliant.  Specific actions
##      include:
##
##          1.  Read the list of feature names provided with the source data.
##          2.  Correct known typographical errors in these names.
##          3.  Categorize the names as either time domain, frequency domain
##              or vector angle measurements.
##          4.  Reformat vector angle names to angle.<meas1>.to.<meas2>.
##          5.  Reformat measurement ranges to <lower>.to.<upper>.
##          6.  Standardize the names by moving all function names to the
##              end of the feature name.
##          7.  Replace cryptic measurement function names with human readable
##              equivalents.  Standardize the capitalization.
##          8.  Add the subject and activity column names.
##          9.  Return the complete list of column names to the caller.
##

generateColumnNames <- function() {
    
    ##
    ##  Read the feature names from the features.txt file provided with
    ##  the source data.  Create a list of the read names.  If the file
    ##  cannot be read, display an error message and halt the script.
    ##
    fn.features <- "./data-raw/UCI HAR Dataset/features.txt"
    if (!file.exists(fn.features)) {
        stop("Unable to open features file")
    }
    feature.names <- as.list(read.table(fn.features,stringsAsFactors=FALSE)[,2])
    
    ##
    ##  Clean up known typographical errors in orginal feature name list.
    ##  Replace the phrase "BodyBody" with a single "Body".  Remove an
    ##  extraneous closing parenthesis that occurs in the middle of a
    ##  function argument list.
    ##
    feature.names <- gsub("BodyBody" , "Body" , feature.names)
    feature.names <- gsub("\\),"     , ","    , feature.names)
    
    ##
    ##  Clarify feature domain.  Replace an initial "t" with "time." and
    ##  replace an initial "f" with "freq.".
    ##
    feature.names <- gsub("tBody"    , "time.Body"    , feature.names)
    feature.names <- gsub("tGravity" , "time.Gravity" , feature.names)
    feature.names <- gsub("fBody"    , "freq.Body"    , feature.names)
    feature.names <- gsub("fGravity" , "freq.Gravity" , feature.names)
    
    ##
    ##  Convert angle features to the format angle.<measurement-1>.to.<measurement-2>
    ##
    feature.names <- gsub("^angle\\((.*),(.*)\\)" , "angle.\\1.to.\\2" , feature.names)
    
    ##
    ##  Convert ranges from "<x>,<n>" to "x.to.n".  Replace hyphens with periods.
    ##  Move all functions name to the end of the feature name.
    ##
    feature.names <- gsub(","                     , ".to."       , feature.names)
    feature.names <- gsub("\\-"                   , "."          , feature.names)
    feature.names <- gsub("(.*)\\.(.*)\\(\\)(.*)" , "\\1\\3.\\2" , feature.names)
    feature.names <- gsub("(.*)\\.maxInds(.*)"    , "\\1\\3.\\2" , feature.names)
    
    ##
    ##  Replace source function names with more complete descriptions.  Some abbreviations
    ##  are still used to prevent the column names from becoming too long.
    ##
    feature.names <- gsub("mean$"        , "Mean"                 , feature.names)
    feature.names <- gsub("std$"         , "StdDev"               , feature.names)
    feature.names <- gsub("mad$"         , "MedianAbsDev"         , feature.names)
    feature.names <- gsub("max$"         , "Maximum"              , feature.names)
    feature.names <- gsub("min$"         , "Minimum"              , feature.names)
    feature.names <- gsub("sma$"         , "SignalMagArea"        , feature.names)
    feature.names <- gsub("energy$"      , "Energy"               , feature.names)
    feature.names <- gsub("iqr$"         , "InterQuartileRange"   , feature.names)
    feature.names <- gsub("entropy$"     , "SignalEntropy"        , feature.names)
    feature.names <- gsub("arCoeff$"     , "AutoregressCoeff"     , feature.names)
    feature.names <- gsub("correlation$" , "CorrelationCoeff"     , feature.names)
    feature.names <- gsub("maxInds$"     , "MaximumMagIndex"      , feature.names)
    feature.names <- gsub("meanFreq$"    , "MeanFrequency"        , feature.names)
    feature.names <- gsub("skewness$"    , "Skewness"             , feature.names)
    feature.names <- gsub("kurtosis$"    , "Kurtosis"             , feature.names)
    feature.names <- gsub("bandsEnergy$" , "FreqBandEnergy"       , feature.names)
    
    ##
    ##  Add the column names for subject and activity and return the complete
    ##  list to the caller.
    ##
    c("subject","activity",feature.names)
}