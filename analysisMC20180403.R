library(dplyr)

load("fullMC.Rdata")

fullMCdf <-as.data.frame(fullMC)

summary(fullMCdf)

a<-table(fullMC$ICD9CODX)
a[names(a)==696]
fullMCICD<-as.data.frame(table(fullMC$ICD9CODX))
#write.csv(fullMCICD, file="icd.csv")

cases <- table(fullMC$ICD9CODX, fullMC$DUPERSID)

n <- fullMC$DUPERSID %>% unique %>% length
# > n
# [1] 155228

obs <-fullMC$DUPERSID %>% length
# > obs
# [1] 1112479

fullMC$ICD9PROX[names(fullMC$ICD9PROX)==696]
#0

psorasisByID <- fullMC %>% 
  filter(ICD9CODX==696) %>%
  select(DUPERSID, ICD9CODX) %>% 
  as.data.frame

length(unique(psorasisByID$DUPERSID))
#[1] 797

length(psorasisByID$ICD9CODX)
#[1] 1223