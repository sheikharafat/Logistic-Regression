
library(dplyr)
##Read the data
d<-read.csv("cancer_15_19.csv",header = T)

#factoring the categorical variables
#drug related predictors
d$METHAMFLAG.f<-factor(d$METHAMFLAG)
d$MRJFLAG.f<-factor(d$MRJFLAG)
d$COCFLAG.f<-factor(d$COCFLAG)
d$CRKFLAG.f<-factor(d$CRKFLAG)
d$HERFLAG.f<-factor(d$HERFLAG)
d$LSDFLAG.f<-factor(d$LSDFLAG)
d$HALLUCFLAG.f<-factor(d$HALLUCFLAG)

#depression related predictor
d$SPDYR.f<-factor(d$SPDYR)
d$MHSUITHK.f<-factor(d$MHSUITHK)
d$MHSUIPLN.f<-factor(d$MHSUIPLN)

#response
d$CANCEREVR.f<-factor(d$CANCEREVR)

#recode the response "1"= Having cancel and "0"= Don't have cancer
d$CANCEREVR.f<-recode(d$CANCEREVR.f,"2" ="0")

#fit logistic regression model for drug
mod_logit_drug <- glm(CANCEREVR.f~METHAMFLAG.f+MRJFLAG.f+COCFLAG.f+CRKFLAG.f+HERFLAG.f+LSDFLAG.f+HALLUCFLAG.f, data=d, family="binomial")

summary(mod_logit_drug)

pchisq(47617-47512, 67651 -67644, lower.tail = FALSE)

anova(mod_logit_drug, test="Chisq")

###Interpretation of coefficients

exp(mod_logit_drug$coefficients)-1


#fit logistic regression model for depression

mod_logit_depression <- glm(CANCEREVR.f~SPDYR.f+MHSUITHK.f+MHSUIPLN.f, data=d, family="binomial")

summary(mod_logit_depression)

pchisq(47617-47415, 67651 -67648, lower.tail = FALSE)

anova(mod_logit_depression, test="Chisq")


###Interpretation of coefficients

exp(mod_logit_depression$coefficients)-1


#fit logistic regression model for drug and depression

mod_logit_dr_de <- glm(CANCEREVR.f~METHAMFLAG.f+MRJFLAG.f+COCFLAG.f+CRKFLAG.f+HERFLAG.f+LSDFLAG.f+HALLUCFLAG.f+SPDYR.f+MHSUITHK.f+MHSUIPLN.f, data=d, family="binomial")


summary(mod_logit_dr_de)

pchisq(47617-47335, 67651 -67641, lower.tail = FALSE)

anova(mod_logit_dr_de, test="Chisq")

