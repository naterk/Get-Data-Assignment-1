##ReadMe

Course:  Getting and Cleaning Data  
Assignment:  1

###Assignment Description

The assignment was to create two tidy data sets based on [data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the Human Activity Recognition Using Smartphone data set available from the Machine Learning Repository at the Center for Machine Learning and Intelligence Systems at the University of California, Irvine (UCI). The original source for the data is the Non Linear Complex Systems Laboratory at the Università degli Studi di Genova, Italy.

During the assignment, the student was to accomplish the following:

1. Merge the training and test data sets available from UCI website to create a single, aggregated data set.  This involved downloading the data set from UCI, extracting the original source files, vertically combining the activity, subject, and feature measurements stored in individual files, and horizontally combining the training and test data into a single data frame.

2. Extract only the measurements on the mean and standard deviation for each measurement.  This involved subsetting the raw data set created in step one, and selecting only measurements identified in the source material as containing the mean or standard deviation.  This is the first tidy data set.  It is stored in the repo as `tidy1.txt`.  In the source data, the relevant measurements were labeled with _mean()_ or _std()_ respectively.  The source data also included a measurement _meanFreq_ which was defined as a "weighted average of the frequency components."  I opted to exclude this data from my tidy data sets because, strictly speaking, a weighted average is not a mean, and there was no corresponding standard deviation measurement.  Community TAs on the discussion board indicated that either choice was valid.

3. Use descriptive activity names to name the activities in the data set.  This involved replacing the integer activity codes in the original source data with human readable factor names in the tidy data.

4. Appropriately label the data set with descriptive variable names.  The source data included a file `features_info.txt` that provided labels for the measurement data.  These names contained typographical errors and cryptic abbreviations.  They also included characters that were not compliant with R column naming conventions.  As part of the assignment, these names were converted to human readable column names that complied with R naming rules.

5. Create a second tidy data set, based on the first, that summarized the data by providing the average of each variable for each activity and each subject.  The student had the option of creating either a _wide_ or _long_ format summary.  The script described below creates both formats.  I submitted the _wide_ format data for grading, since it best matched the original data structures.  The second tidy data set is in the file `tidy2.txt` in this repo.

6. Create a `README.md` file that describes the assignment and the scripts.  This is the `README.md` file.

7. Create a `CodeBook.md` file that describes the variables, data, transformations, and other work undertaken to cleanup the raw data.  While the assignment did not specify which data set was to be described in the code book, the Community TAs clarified in the discussion forum that it was to describe the second tidy data set that was uploaded to Coursera when the assignment was submitted.

###Files

The following files are included in the repo as part of this assignment.

 File           | Description
 -------------- | -----------
 README.md      | This file.  Describes the assignment, assumptions, and R script.
 CodeBook.md    | Describes the variables, data, and transformations contained in the second tidy data set
 run_analysis.R | An R script that downloads and extracts the source data, aggregates the raw data into a single data frame, updates the activity and column labels to include human readable names, and creates and saves two tidy data sets.  The script is described in detail below and in comments contained in the source code.
 tidy1.txt      | The first tidy data set which extracts all mean and standard deviation measurements from the original source data set.  It is in a format that can be read with the `read.table()` function in R.
 tidy2.txt  | The second tidy data set, which was also uploaded to Coursera, includes the averages of all measurements in the tidy1 data set.  It is in _wide_ format and is described in the file `CodeBook.md` in this repo..  It is in a format that can be read with the `read.table()` function in R.
 

###Scripts

The file `run_analysis.R` in this repo implements a number of R functions to download and consolidate the source data set and produce the two tidy files required by this assignment.  To use the script, type the following:

	source("run_analysis.R")  
	generateDataSets()

By default, the `generateDataSets()` function does not download and extract the source data if it is already present locally.  By passing the function the parameter `force=TRUE` you can override this default action and force the source data to be downloaded.

The script implements several functions that can be used individually to manipulate the data.  The function `getDataFiles()` will download and uncompress the source data files.  As above, providing the argument `force=TRUE` will override the default behavior and force the data to be downloaded even if it is already present.

The function `assembleRawData()` will return a data frame containing the consolidated and cleaned source data.  This data frame can be passed to the function `generateTidyData(raw.data)` which will create three text files containing the tidy1, wide tidy2, and long tidy2 data sets.

The script requires the R packages `tools`, `reshape2`, and `plyr`.

###Functions

The following describes the functions used to assemble and clean the data and to produce the required tidy data sets.  Each description provides the function name, identifies any arguments passed to the function, describes any values returned by the function, and identifies the actions taken by the function to accomplish its task.

#####generateDataSets(force=FALSE)

	
	  Function
	      generateDataSets(force=FALSE)  [Main Function]
	
	  Arguments
	      force
	          By default, the generateDataSets() function does not download
	          and extract the source data if it is already present locally.  By
	          setting force to TRUE, the caller can override the default behavior
	          and force the source data to be downloaded again.  The default is
	          FALSE.
	
	  Returns
	      Nothing
	
	  Description
	      The generateDataSets() function accomplishes all tasks necessary to
	      retrieve the raw data, create the tidy data sets, and save the results
	      to disk.  Specifically, the function:
	
	          1.  Gets and extracts the raw data files from the UCI website.
	          2.  Assembles the source files into a single, raw data set.
	          3.  Generates the required tidy data sets and saves them to disk.
	
#####getDataFiles(force=FALSE)
	
	  Function
	      getDataFiles(force=FALSE)
	
	  Arguments
	      force
	          If set to TRUE causes getDataFiles() to download and re-extract
	          the source files, even if they already exist on the local machine.
	          If set to FALSE, the function will not download the source files
	          if they are already present in the requisite directory.
	
	  Returns
	      Nothing.
	
	  Description
	      The getDataFiles() function performs the following actions:
	
	          1.  If necessary, creates a directory to hold the raw source files.
	          2.  Downloads the compressed source material from the specified
	              site.  By default, this step is skipped if the source material
	              is already present.  Setting 'force' to TRUE will override this
	              default behavior and forces the download to occur.
	          3.  Appends an entry to a log file.  The entry includes the time
	              that the download occurred, an md5 checksum of the source data
	              file, and the URL from which the data was downloaded.
	          4.  Uncompresses the source data file into the appropriate directory.
	
#####assembleRawData()
	
	  Function
	      assembleRawData()
	
	  Arguments
	      None
	
	  Returns
	      A cleaned-up data frame containing the subject, activity, and all
	      feature measurements for each event in the 'test' and 'train' data
	      sets.
	
	  Description
	      The assembleRawData() function calls getRawData() to construct a
	      cleaned-up version of the 'test' and 'train' data, and then combines
	      them into a single data.frame. The assembled data frame is
	      returned to the caller.

#####generateTidyData()
	
	  Function
	      generateTidyData(raw.data)
	
	  Arguments
	      raw.data
	          A data.frame containing the cleaned-up source data that is the
	          basis for the tidy data.
	
	  Returns
	      Nothing
	
	  Description
	      The generateTidyData() function creates two separate tidy data sets
	      from the raw data provided by the caller.  The first tidy data set
	      is an extract of the subject, activity, and all mean and standard
	      deviation measurements.  The second tidy data set is the average of
	      all measurements (summarized by activity and subject).  Two versions
	      of the second tidy data set are created.  The first is in 'wide' format
	      and contains:
	
	          activity, subject, measure 1, measure 2, measure 3, etc.
	
	      The second version is in 'long' format and contains:
	
	          activity, subject, feature name, measurement value
	
	      All data sets and versions are written to local files in a format
	      allowing them to be read with read.table().
	
#####getRawData(data.set)
	
	  Function
	      getRawData(data.set)
	
	  Arguments
	      data.set
	          A string specifying which raw data set to create.  Valid options
	          are "test" and "train".  There is no default.
	
	  Returns
	      A data frame that consolidates the subject, activity, and feature
	      measurements from the caller specified source data set.
	
	  Description
	      The getRawData() function consolidates subject, activity, and feature
	      measurements for either the "test" or "train" data sets.  Actions
	      performed by the script include:
	
	          1.  Validate the caller supplied data set name.
	          2.  Generate the path to the source files for the specific data set.
	          3.  Read the activity, subject, and feature files.
	          4.  Consolidate the data into a single data frame.
	          5.  Assign human readable and R-compliant column names.
	          6.  Append a column identifying which data set was used.
	          7.  Convert activities to human readable factors.
	          8.  Return the cleaned-up raw data to the caller.
	
#####createTidy1(raw.data)
	
	  Function
	      createTidy1(raw.data)
	
	  Arguments
	      raw.data
	          A data frame containing the consolidated raw data for the 'test' and
	          'train' data sets.  The data set contains the subject, activity,
	          measurements, and data set identifier.
	
	  Returns
	      A tidy data sets consisting of the subject, activity, mean measurements
	      and standard deviation measurements.
	
	  Description
	      The createTidy1() function returns the required columns of the specified
	      data set by matching patterns against the list of column names.  Regular
	      expressions are used to identify:
	
	          Subject identifier
	              Selects the column whose name is 'subject'
	          Activity type
	              Selects the column whose name is 'activity'
	          Mean measurement data
	              Selects all columns ending in the string '.Mean'.  In the original
	              data, these columns contained the string 'mean()', which is not a
	              legal R column name.  [See the function generateColumnNames for more
	              details.]  The project instructions were unclear whether the 'meanFreq'
	              measurements should be included in the tidy data set.  Since they are
	              weighted averages and since they were not paired with standard deviation
	              measurements, I opted to exclude them.
	          Standard deviation data
	              Selects all columns ending in the string '.StdDev'.  In the original
	              data, these columns contained the string 'std().
	
	      The function performs the following actions:
	
	          1.  Extract the column names from the cleaned-up raw data.
	          2.  Determine the column numbers that match the above patterns
	          3.  Create a single, ordered list of matching column numbers,
	              removing any duplicates (there should be none).
	          4.  Subset the raw data, returning the identified columns to the caller.
	          
#####createTidy2(data.set,tidy.type="wide")
	
	  Function
	      createTidy2(data.set,tidy.type)
	
	  Arguments
	      data.set
	          A data frame that contains an 'activity' and 'subject' column in
	          addition to a series of measurements.  Typically this is the
	          data.set returned from createTidy1().
	      tidy.type
	          A character string specifying whether the summary, tidy data set
	          should be 'wide' or 'long' (see below).  The default is 'wide'.
	
	  Returns
	      A tidy data set consisting of the average of each measurement summarized
	      by activity and subject.  The returned data frame can be either 'wide' or
	      'long' depending on the tidy.type parameter.
	
	  Description
	      The createTidy2() function produces a data set containing the average of
	      each feature measurement for each activity and subject.  The tidy.type
	      argument specifies whether the produced data set is either 'wide' or
	      'long'.  When 'wide' is selected, the data is formatted as:
	
	          activity, subject, measurement-1, measurement-2, measurement-3, etc.
	
	      When 'long' is selected, the data is organized as:
	
	          activity, subject, measurement-name, measurement-value
	
	      The function performs the following actions:
	
	          1.  Verify the caller supplied format type.
	          2.  Use ddply() to group the data by activity and subject.  Use
	              numcolwise() to compute the mean for each grouping.  This is
	              the 'wide' data set.
	          3.  If the 'long' format is requested, use melt() to create a separate
	              row for each feature type.  The melt() function is applied to the
	              'wide' format data set which already includes the means.
	          4.  Provide human readable column names for the 'long' format.
	          5.  Return the tidy data set to the caller.
	
#####generateColumnNames()
	
	  Function
	      generateColumnNames()
	
	  Arguments
	      None
	
	  Returns
	      A list of strings containing human readable and R-compliant names for
	      all columns in the aggregated raw data set.
	
	  Description
	      The generateColumns() function will produce a list of column names for the
	      newly aggregated raw data set.  These names are based on the feature measurement
	      names contained in the features.txt file supplied with the source data.
	      These names are modified to correct typographical errors in the source
	      data, expanded to make them more easily understood by a human reviewer,
	      and edited to ensure that the new names are R-compliant.  Specific actions
	      include:
	
	          1.  Read the list of feature names provided with the source data.
	          2.  Correct known typographical errors in these names.
	          3.  Categorize the names as either time domain, frequency domain
	              or vector angle measurements.
	          4.  Reformat vector angle names to angle.<meas1>.to.<meas2>.
	          5.  Reformat measurement ranges to <lower>.to.<upper>.
	          6.  Standardize the names by moving all function names to the
	              end of the feature name.
	          7.  Replace cryptic measurement function names with human readable
	              equivalents.  Standardize the capitalization.
	          8.  Add the subject and activity column names.
	          9.  Return the complete list of column names to the caller.
	