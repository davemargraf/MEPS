library(SASxport) #Reads SAS files.

# Store the urls of the Full Year Consolidated data files
fy2015 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h180ssp.zip"
fy2014 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h170ssp.zip"
fy2013 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h162ssp.zip"
fy2012 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h154ssp.zip"
fy2011 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h146ssp.zip"
fy2010 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h137ssp.zip"
fy2009 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h128ssp.zip"
fy2008 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h120ssp.zip"
fy2007 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h112ssp.zip"
fy2006 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h104ssp.zip"

# Store the urls of the Medical Conditions files
mc2015 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h180ssp.zip"
mc2014 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h170ssp.zip"
mc2013 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h162ssp.zip"
mc2012 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h154ssp.zip"
mc2011 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h146ssp.zip"
mc2010 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h137ssp.zip"
mc2009 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h128ssp.zip"
mc2008 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h120ssp.zip"
mc2007 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h112ssp.zip"
mc2006 <-
  "https://meps.ahrq.gov/mepsweb/data_files/pufs/h104ssp.zip"

# Create a vector to store the urls of the medical conditions zip files
urlFY <-
  c(fy2006,
    fy2007,
    fy2008,
    fy2009,
    fy2010,
    fy2011,
    fy2012,
    fy2013,
    fy2014,
    fy2015)

# Create a vector to store the urls of the medical conditions zip files
urlMC <-
  c(mc2006,
    mc2007,
    mc2008,
    mc2009,
    mc2010,
    mc2011,
    mc2012,
    mc2013,
    mc2014,
    mc2015)


# A loop to gather the Full Year data from the web and save the files
for (i in 2006:2015) {
  download.file(urlFY[i - 2005], temp <-
                  tempfile()) # Download the zipped data
  unzippedFile = unzip(temp)                       # Store the data in a temporary file
  fileName <-
    paste("FY", i, sep = '')                     # Assign variable name for each year file
  assign(fileName, read.xport(unzippedFile))            # Associate the variable name with the data
  unlink(temp)                                      # Delete the temporary file
}


# A loop to gather the data from the web and save the files
for (i in 2006:2015) {
  download.file(urlMC[i - 2005], temp <-
                  tempfile()) # Download the zipped data
  unzippedFile = unzip(temp)                       # Store the data in a temporary file
  fileName <-
    paste("MC", i, sep = '')                     # Assign variable name for each year file
  assign(fileName, read.xport(unzippedFile))            # Associate the variable name with the data
  unlink(temp)                                      # Delete the temporary file
}




###########################################
# Extra code
###########################################
#for (i in seq_along(url_mc)){
for (i in 2006:2015) {
  print(url_mc[i - 2005])
  download.file(url_mc[i - 2005], temp <- tempfile())
  unzipped_file = unzip(temp)
  nam <- paste("MC", i, sep = '')
  print(nam)
  assign(nam, read.xport(unzipped_file))
  unlink(temp)  # Unlink to delete temporary file
}

2005
2004
2003
2002
2001
2000
1999
1998
1997
1996

mc2015 <- read.xport("meps_mc2015h180.ssp")
url2015 <-
  read.xport('https://meps.ahrq.gov/data_files/pufs/h180.ssp')

url  <- 0
url <-
  'http://biostat.mc.vanderbilt.edu/wiki/pub/Main/Hmisc/test2.xpt'

urlTest <- read.xport(url)

url <-
  'http://biostat.mc.vanderbilt.edu/wiki/pub/Main/Hmisc/test2.xpt'
w <- lookup.xport(url)
## End(Not run)

url <-
  'http://biostat.mc.vanderbilt.edu/wiki/pub/Main/Hmisc/test2.xpt'
w <- lookup.xport(url)

#2013 Full consolidated
download.file("https://meps.ahrq.gov/mepsweb/data_files/pufs/h163ssp.zip",
              temp <- tempfile())
unzipped_file = unzip(temp)
h163 = read.xport(unzipped_file)
unlink(temp)  # Unlink to delete temporary file
