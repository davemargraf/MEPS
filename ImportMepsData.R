library(SASxport) #Reads SAS files.
library(dplyr)

# Store the urls of the Full Year Consolidated data files
fy2015 <-
  "https://meps.ahrq.gov/data_files/pufs/h181ssp.zip"
fy2014 <-
  "https://meps.ahrq.gov/data_files/pufs/h171ssp.zip"
fy2013 <-
  "https://meps.ahrq.gov/data_files/pufs/h163ssp.zip"
fy2012 <-
  "https://meps.ahrq.gov/data_files/pufs/h155ssp.zip"
fy2011 <-
  "https://meps.ahrq.gov/data_files/pufs/h147ssp.zip"
fy2010 <-
  "https://meps.ahrq.gov/data_files/pufs/h138ssp.zip"
fy2009 <-
  "https://meps.ahrq.gov/data_files/pufs/h129ssp.zip"
fy2008 <-
  "https://meps.ahrq.gov/data_files/pufs/h121ssp.zip"
fy2007 <-
  "https://meps.ahrq.gov/data_files/pufs/h113ssp.zip"
fy2006 <-
  "https://meps.ahrq.gov/data_files/pufs/h105ssp.zip"

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

#bigFY <- data.frame()

# A loop to gather the Full Year data from the web and save the files
for (i in 2006:2015) {
  temp <- tempfile()
  
  urlFY[i - 2005] %>%
    download.file(temp) # Download the zipped data
  
  unzippedFile <-
    temp %>%
    unzip %>%
    read.xport %>%
    mutate(year = i, dataSet = "fy")    # Store the data in a temporary file
  
  fileName <-
    paste("FY", i, sep = '')        # Assign variable name for each year file
  
  assign(fileName, unzippedFile)    # Associate the variable name with the data
  
  #bigFY <- bind_rows(bigFY, unzippedFile)
  
  #saveRDS(unzippedFile, fileName)
  
  unlink(temp)                      # Delete the temporary file
  #gc()
}

#bigFy <- bind_rows(FY2006:FY201)
saveRDS(bigFY, "allFYdata")


#bigMC <- data.frame()

# A loop to gather the data from the web and save the files
for (i in 2006:2015) {
  temp <- tempfile()
  
  urlMC[i - 2005] %>%
    download.file(temp) # Download the zipped data
  
  unzippedFile <-
    temp %>%
    unzip %>%
    read.xport %>%
    mutate(year = i, dataSet = "mc")    # Store the data in a temporary file
  
  fileName <-
    paste("MC", i, sep = '')        # Assign variable name for each year file
  
  assign(fileName, unzippedFile)    # Associate the variable name with the data
  
  #bigMC <- bind_rows(bigMC, unzippedFile)
  
  #saveRDS(unzippedFile, fileName)
  
  unlink(temp)                      # Delete the temporary file
}

#saveRDS(bigMC, "allMCdata")

###save csv ad Rdata
write.csv(FY2006,file="FY2006.csv")
write.csv(FY2007,file="FY2007.csv")
write.csv(FY2008,file="FY2008.csv")
write.csv(FY2009,file="FY2009.csv")
write.csv(FY2010,file="FY2010.csv")
write.csv(FY2011,file="FY2011.csv")
write.csv(FY2012,file="FY2012.csv")
write.csv(FY2013,file="FY2013.csv")
write.csv(FY2014,file="FY2014.csv")
write.csv(FY2015,file="FY2015.csv")

save(FY2006,file="FY2006.RData")
save(FY2007,file="FY2007.RData")
save(FY2008,file="FY2008.RData")
save(FY2009,file="FY2009.RData")
save(FY2010,file="FY2010.RData")
save(FY2011,file="FY2011.RData")
save(FY2012,file="FY2012.RData")
save(FY2013,file="FY2013.RData")
save(FY2014,file="FY2014.RData")
save(FY2015,file="FY2015.RData")

write.csv(MC2006,file="MC2006.csv")
write.csv(MC2007,file="MC2007.csv")
write.csv(MC2008,file="MC2008.csv")
write.csv(MC2009,file="MC2009.csv")
write.csv(MC2010,file="MC2010.csv")
write.csv(MC2011,file="MC2011.csv")
write.csv(MC2012,file="MC2012.csv")
write.csv(MC2013,file="MC2013.csv")
write.csv(MC2014,file="MC2014.csv")
write.csv(MC2015,file="MC2015.csv")

save(MC2006,file="MC2006.RData")
save(MC2007,file="MC2007.RData")
save(MC2008,file="MC2008.RData")
save(MC2009,file="MC2009.RData")
save(MC2010,file="MC2010.RData")
save(MC2011,file="MC2011.RData")
save(MC2012,file="MC2012.RData")
save(MC2013,file="MC2013.RData")
save(MC2014,file="MC2014.RData")
save(MC2015,file="MC2015.RData")

fullMC <- bind_rows(MC2006, 
                    MC2007, 
                    MC2008,
                    MC2009, 
                    MC2010,
                    MC2011,
                    MC2012,
                    MC2013,
                    MC2014,
                    MC2015) %>% data.frame()

save(fullMC, file = "fullMC.Rdata")
write.csv(fullMC,file="fullMC.csv")




