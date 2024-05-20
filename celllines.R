#Machine Learning for anti cancer drug efficacy

#Load the libraries needed 


#Import data and store as objects that you can view later
es8_ic50<-read.delim('es8_Ic50.tsv')
farage_ic50<-read.delim('farage_Ic50.tsv')
es8_auc<-read.delim('es8_auc.tsv')
farage_auc<-read.delim('farage_auc.tsv')

#View the data 
View(es8_ic50)
View(es8_auc)
View(farage_ic50)
View(farage_auc)

#es8_ic50 data transformation
empty<-arrange(es8_ic50,desc(is.na(Targets)),Targets) #Does not use quotes
