#R is an interpreted language
#R 'whole-object' functions are better than iterative approaches
setwd('/Users/matt/Dropbox/hackerschool/titanic')
passenger_data_filename = "test.csv" #passenger data

#input data from CSV file
passengers <- read.table(paste(passenger_data_filename),header=TRUE,sep=",",,blank.lines.skip=TRUE)
#pastes contents of variable as string. If >1 var, separates with sep parameter

###Naive Prediction Model### - wrap this in a function
npred=function(data,ind,ind_vals,dep,dep_vals){
    model<-data.frame(ind=ind_vals,dep=dep_vals) #for convenience of user, not necessary
    names(model)=c(ind,dep)
    pred<-dep_vals[match(get(data)[,ind],model[,ind])]
    return(list(model,pred))}#returns location of 1st vector in 2nd vector.
    #Uses that position to index into 'survived' vector

model_preds<-npred(data='passengers',ind='sex',ind_vals=c('male','female'),dep='survived',dep_vals=c(0,1))
preds<-model_preds[2]
write.csv(preds,'preds',row.names=FALSE)
#npred documentation
#given vectors ind_vals and dep_vals (the 'naive model'), this function
#uses ind_vals and dep_vals
#to map 'ind_vals' in the 'ind' field of the 'data' matrix to
# a return a list.
  # the first element of the list is a list showing the naive model
  # the second element is a new vector of the map from ind_vals to dep_values,
  # applied to the 'ind' field of 'data'
# sample usage: 
  # data<-'p'
  # ind<-'sex'
  # dep<-'survived'
  # ind_vals<-c('male','female')
  # dep_vals<-c(0,1)
#  x<-npreds(data,ind,ind_vals,dep,dep_vals)

#typeof(p)
#class(p)


