# Project Name: "Segmentation_Industry_Plastics"
rm(list = ls( )) # clean up the workspace
set.seed(123444222)
######################################################################

# THESE ARE THE PROJECT PARAMETERS NEEDED TO GENERATE THE REPORT

# When running the case on a local computer, modify this in case you saved the case in a different directory 
# (e.g. local_directory <- "C:/user/MyDocuments" )
# type in the Console below help(getwd) and help(setwd) for more information
local_directory <- getwd()

# Clean up any left over tmp directories
clean1 <- unlink(paste(local_directory,"../TMPdirReport",sep="/"), recursive = TRUE )      
clean2 <- unlink(paste(local_directory,"../TMPdirSlides",sep="/"), recursive = TRUE )      
if (clean1 + clean2)
  setwd("../")
local_directory <- getwd()

cat("\n *********\n WORKING DIRECTORY IS ", local_directory, "\n PLEASE CHANGE IT IF IT IS NOT CORRECT using setwd(..) - type help(setwd) for more information \n *********")

# Please ENTER the name of the file with the data used. The file should contain a matrix with one row per observation (e.g. person) and one column per attribute. THE NAME OF THIS MATRIX NEEDS TO BE ProjectData (otherwise you will need to replace the name of the ProjectData variable below with whatever your variable name is, which you can see in your Workspace window after you load your file)
datafile_name="Plastics" # do not add .csv at the end! make sure the data are numeric!!!! check your file!

# Please ENTER the filename of the Report and Slides (in the doc directory) to generate 

#report_file = "Report"
report_file = "SomeCode"
slides_file = "Slides"

# Please ENTER then original raw attributes to use. 
# Please use numbers, not column names! e.g. c(1:5, 7, 8) uses columns 1,2,3,4,5,7,8
factor_attributes_used= c(3:22)

# Please ENTER the selection criterions for the factors to use. 
# Choices: "eigenvalue", "variance", "manual"
factor_selectionciterion = "manual"

# Please ENTER the desired minumum variance explained 
# (ONLY USED in case "variance" is the factor selection criterion used). 
minimum_variance_explained = 65  # between 1 and 100

# Please ENTER the number of factors to use 
# (ONLY USED in case "manual" is the factor selection criterion used).
manual_numb_factors_used = 10

# Please ENTER the rotation eventually used (e.g. "none", "varimax", "quatimax", "promax", "oblimin", "simplimax", and "cluster" - see help(principal)). Defauls is "varimax"
rotation_used="varimax"


# cluster start

# Please ENTER then original raw attributes to use for the segmentation (the "segmentation attributes")
# Please use numbers, not column names! e.g. c(1:5, 7, 8) uses columns 1,2,3,4,5,7,8
# for boats possibly use: c(28,25,27,14,20,8,3,12,13,5,9,11,2,30,24), for Mall_Visits use c(2:9)
segmentation_attributes_used = c(6,8,18,12,15,16) 

# Please ENTER then original raw attributes to use for the profiling of the segments (the "profiling attributes")
# Please use numbers, not column names! e.g. c(1:5, 7, 8) uses columns 1,2,3,4,5,7,8
profile_attributes_used = c(3:44) # for boats use c(2:82), for Mall_Visits use c(2:9)

# Please ENTER the number of clusters to eventually use for this report
numb_clusters_used = 3 # for boats possibly use 5, for Mall_Visits use 3

# Please enter the minimum distance from "1" the profiling values should have in order to be colored 
# (e.g. using heatmin = 0 will color everything - try it)
heatmin = 0.1

# Please enter the method to use for the profiling (e.g. "hclust" or "kmeans"):
profile_with = "hclust"

# Please ENTER the distance metric eventually used for the clustering in case of hierarchical clustering 
# (e.g. "euclidean", "maximum", "manhattan", "canberra", "binary" or "minkowski" - see help(dist)). 
# DEFAULT is "euclidean"
distance_used="euclidean"

# Please ENTER the hierarchical clustering method to use (options are:
# "ward", "single", "complete", "average", "mcquitty", "median" or "centroid")
# DEFAULT is "ward"
hclust_method = "ward"

# Please ENTER the kmeans clustering method to use (options are:
# "Hartigan-Wong", "Lloyd", "Forgy", "MacQueen"
# DEFAULT is "Lloyd"
kmeans_method = "Lloyd"

# end cluster

# classification starts

# Please ENTER the class (dependent) variable:
# Please use numbers, not column names! e.g. 82 uses the 82nd column are dependent variable.
# YOU NEED TO MAKE SURE THAT THE DEPENDENT VARIABLES TAKES ONLY 2 VALUES: 0 and 1!!!
dependent_variable= 46

# Please ENTER the attributes to use as independent variables 
# Please use numbers, not column names! e.g. c(1:5, 7, 8) uses columns 1,2,3,4,5,7,8
#independent_variables= c(23:28, 35:42) # use 54-80 for boats
independent_variables= c(23:42)
#independent_variables= c(3:22)

# Please ENTER the profit/cost values for the correctly and wrong classified data:
actual_1_predict_1 = 100
actual_1_predict_0 = -75
actual_0_predict_1 = -50
actual_0_predict_0 = 0

# Please ENTER the probability threshold above which an observations  
# is predicted as class 1:
Probability_Threshold=50 # between 1 and 99%

# Please ENTER the percentage of data used for estimation
estimation_data_percent = 80
validation_data_percent = 10

# Please enter 0 if you want to "randomly" split the data in estimation and validation/test
random_sampling = 0

# Tree parameter
# PLEASE ENTER THE Tree (CART) complexity control cp (e.g. 0.001 to 0.02, depending on the data)
CART_cp = 0.01

Cluster_to_test <- 2

# Please enter the minimum size of a segment for the analysis to be done only for that segment
min_segment = 100


# end classification

# Please enter the minimum number below which you would like not to print - this makes the readability of the tables easier. Default values are either 10e6 (to print everything) or 0.5. Try both to see the difference.
MIN_VALUE=0.5

# Please enter the maximum number of observations to show in the report and slides 
# (DEFAULT is 50. If the number is large the report and slides may not be generated - very slow or will crash!!)
max_data_report = 40 # can also chance in server.R


###########################
# Would you like to also start a web application on YOUR LOCAL COMPUTER once the report and slides are generated?
# Select start_webapp <- 1 ONLY if you run the case on your local computer
# NOTE: Running the web application on your LOCAL computer will open a new browser tab
# Otherwise, when running on a server the application will be automatically available
# through the ShinyApps directory

# 1: start application on LOCAL computer, 0: do not start it
# SELECT 0 if you are running the application on a server 
# (DEFAULT is 0). 
start_local_webapp <- 0
# NOTE: You need to make sure the shiny library is installing (see below)

################################################
# Now run everything

# this loads the selected data: DO NOT EDIT THIS LINE
ProjectData <- read.csv(paste(paste(local_directory, "data", sep="/"), paste(datafile_name,"csv", sep="."), sep = "/"), sep=";", dec=",", skip=3, header=F, colClasses="character") # this contains only the matrix ProjectData

ProjectDataHeader <- read.csv(paste(paste(local_directory, "data", sep="/"), paste(datafile_name,"csv", sep="."), sep = "/"), sep=";", dec=",", header=F, colClasses="character") # this contains only the matrix ProjectData
colnames(ProjectData) <- ProjectDataHeader[1,] # header
ProjectData <- ProjectData[, -3] # remove the non numeric variable
ProjectData=data.matrix(ProjectData) 
ProjectData <- ProjectData[complete.cases(ProjectData), ]

ProjectData_segment=ProjectData[,segmentation_attributes_used]
ProjectData_profile=ProjectData[,profile_attributes_used]

source(paste(local_directory,"R/library.R", sep="/"))

Profit_Matrix = matrix(c(actual_1_predict_1, actual_0_predict_1, actual_1_predict_0, actual_0_predict_0), ncol=2)
colnames(Profit_Matrix)<- c("Predict 1", "Predict 0")
rownames(Profit_Matrix) <- c("Actual 1", "Actual 0")

test_data_percent = 100-estimation_data_percent-validation_data_percent
CART_control = rpart.control(cp = CART_cp)

if (require(shiny) == FALSE) 
  install_libraries("shiny")
source(paste(local_directory,"R/heatmapOutput.R", sep = "/"))
source(paste(local_directory,"R/runcode.R", sep = "/"))



if (start_local_webapp){
  
  # first load the data files in the data directory so that the App see them
  Plastics <- read.csv(paste(local_directory, "data/Plastics.csv", sep = "/"), sep=";", dec=",", colClasses="character") # this contains only the matrix ProjectData
  Plastics=data.matrix(Plastics) # this file needs to be converted to "numeric"....
  
  # now run the app
  runApp(paste(local_directory,"tools", sep="/"))  
}
