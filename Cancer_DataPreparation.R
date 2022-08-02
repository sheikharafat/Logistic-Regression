
####2015

# Read the original data 
d_2015<- read.table(file = 'NSDUH_2015_Tab.tsv', sep = '\t', header = T)

#keeping the required variables
keep_var<-c("METHAMFLAG","MRJFLAG","COCFLAG","CRKFLAG","HERFLAG","LSDFLAG","HALLUCFLAG","SPDYR","MHSUITHK","MHSUIPLN","CANCEREVR","CATAG3")

d_2015_s<-d_2015[keep_var]

#keeping only specific age 
d_2015_age<- d_2015_s[d_2015_s$CATAG3%in% c(2,3,4,5),]

#keeping only specific cancer
d_2015_cancer<-d_2015_age[d_2015_age$CANCEREVR %in% c(1,2),]

#removing missing values
d_2015_final<-na.omit(d_2015_cancer)

#save the cleaned data in csv format

write.csv(d_2015_final,"d_2015_final.csv")





####2016

# Read the original data 
d_2016<- read.table(file = 'NSDUH_2016_Tab.tsv', sep = '\t', header = T)

#keeping the required variables
d_2016_s<-d_2016[keep_var]

#keeping only specific age 
d_2016_age<- d_2016_s[d_2016_s$CATAG3%in% c(2,3,4,5),]

#keeping only specific cancer
d_2016_cancer<-d_2016_age[d_2016_age$CANCEREVR %in% c(1,2),]

#removing missing values
d_2016_final<-na.omit(d_2016_cancer)

#save the cleaned data in csv format

write.csv(d_2016_final,"d_2016_final.csv")



####2017

# Read the original data 
d_2017<- read.table(file = 'NSDUH_2017_Tab.tsv', sep = '\t', header = T)

#keeping the required variables
d_2017_s<-d_2017[keep_var]

#keeping only specific age 
d_2017_age<- d_2017_s[d_2017_s$CATAG3%in% c(2,3,4,5),]

#keeping only specific cancer
d_2017_cancer<-d_2017_age[d_2017_age$CANCEREVR %in% c(1,2),]

#removing missing values
d_2017_final<-na.omit(d_2017_cancer)

#save the cleaned data in csv format

write.csv(d_2017_final,"d_2017_final.csv")


####2018

# Read the original data 
d_2018<- read.table(file = 'NSDUH_2018_Tab.tsv', sep = '\t', header = T)

#keeping the required variables
d_2018_s<-d_2018[keep_var]

#keeping only specific age 
d_2018_age<- d_2018_s[d_2018_s$CATAG3%in% c(2,3,4,5),]

#keeping only specific cancer
d_2018_cancer<-d_2018_age[d_2018_age$CANCEREVR %in% c(1,2),]

#removing missing values
d_2018_final<-na.omit(d_2018_cancer)

#save the cleaned data in csv format

write.csv(d_2018_final,"d_2018_final.csv")



####2019

# Read the original data 
d_2019<- read.table(file = 'NSDUH_2019_Tab.txt', sep = '\t', header = T)

#keeping the required variables
d_2019_s<-d_2019[keep_var]

#keeping only specific age 
d_2019_age<- d_2019_s[d_2019_s$CATAG3%in% c(2,3,4,5),]

#keeping only specific cancer
d_2019_cancer<-d_2019_age[d_2019_age$CANCEREVR %in% c(1,2),]

#removing missing values
d_2019_final<-na.omit(d_2019_cancer)

#save the cleaned data in csv format

write.csv(d_2019_final,"d_2019_final.csv")



###Read the cleaned data

dat_2015<-read.csv("d_2015_final.csv",header = T)
dat_2016<-read.csv("d_2016_final.csv",header = T)
dat_2017<-read.csv("d_2017_final.csv",header = T)
dat_2018<-read.csv("d_2018_final.csv",header = T)
dat_2019<-read.csv("d_2019_final.csv",header = T)

## combine the data
data<-rbind(dat_2015,dat_2016,dat_2017,dat_2018,dat_2019)

#save the combined data in csv
write.csv(data,"cancer_15_19.csv")



