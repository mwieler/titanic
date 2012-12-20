#R is an interpreted language
setwd('/Users/matt/Dropbox/hackerschool/titanic')
passenger_data_filename = "train.csv" #passenger data

#input data from CSV file
p <- read.table(paste(passenger_data_filename),header=TRUE,sep=",",,blank.lines.skip=TRUE) #pastes contents of variable as string. If >1 var, separates with sep parameter
typeof(p)
class(p)

#np<-p[which(p$survived == 1 & p$sex == 'female'),] #female survivors
fp<-p[which(p$sex == 'female'),] #females
fp<-fp[c("sex","survived")] #keep only sex & survived fields
femalesurvivors<-sum(fp$survived) #
females<-length(fp$survived)
femalesurvivors/females

# male survivors
mp<-p[which(p$sex == 'male'),] #males
mp<-mp[c("sex","survived")] #keep only sex & survived fields
malesurvivors<-sum(mp$survived) #
males<-length(mp$survived)
malesurvivors/males
