#loading the dataset in R
aman12 <- read.csv("E:/aman/studentonlinestudy/aman12.csv", header=FALSE)
View(aman12)
#performing exploratory data analysis on the data set
#1. first step would be knowing about the datatypes
summary(aman12)
library(skimr)
skim(aman12)
summary(aman12)



#statistical analysis on ordinal datatypes present in dataset
#analyzing physical health of students
table(aman12$phi.ear) #hearing problem
table(aman12$phi.eye) #eye power
table(aman12$phi.joint) #pain in joints
table(aman12$phi.obesity) #obesity

#analyzing area from which students belong
table(aman12$region)

#analyzing the courses from which the students belong
table(aman12$education)
#analysing gender
table(aman12$gender)
#analyzing the network part
table(aman12$isp)
table(aman12$networkingdevice)

#analyzing powerbackup
table(aman12$powerbackup)


#1.statistical analysis of pain in joints and obesity

#1.correlated data we can apply linear regression in this part
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$phi.joint, aman12$phi.obesity), aman12$phi.obesity)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))


#2.graphically analyzing the region and ISP
#2. data cleaning on v17 is required for accurate results
#cleaning completed
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$region, aman12$isp), aman12$isp)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#3.graphicaly analyzing region and networking device
#3.data preprocessing or changing the form of data is required for accurate results 
#3. column name v18 for changing data
#cleaning completed
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$region, aman12$networkingdevice), aman12$networkingdevice)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#4.graphicaly analyzing region and courses
#4. data preprocessing required in column name v12
#cleaning done
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$region, aman12$education), aman12$education)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#5. graphicaly analyzing region and powerbackup
#data preprocessing required in v20
#cleaning done 

library(ggplot2)

ggplot(aman12, aes(reorder(aman12$region, aman12$powerbackup), aman12$powerbackup)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#6. graphically analyzing gender and health issue

#data preprocessing cleaning required in column name v13
#cleaning done
#hearing
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$phi.ear, aman12$gender), aman12$gender)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

# eye problem
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$phi.eye, aman12$gender), aman12$gender)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#joint pain
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$phi.joint, aman12$gender), aman12$gender)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#obesity
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$phi.obesity, aman12$gender), aman12$gender)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#7. graphically analyzing powercut and powerbackup

library(ggplot2)

ggplot(aman12, aes(reorder(aman12$powercut, aman12$powerbackup), aman12$powerbackup)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#8. graphically analyzing completion of assignment and submission of assignment on time
#linear regression can be applied
library(ggplot2)

ggplot(aman12, aes(reorder(aman12$completing.assignment, aman12$submitting.assignment), aman12$submitting.assignment)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#9. graphically analyzing region and power cut


library(ggplot2)

ggplot(aman12, aes(reorder(aman12$powercut, aman12$region), aman12$region)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#10. graphically analyzing region and device used
#*requires data clean on v16
#*cleaning done

library(ggplot2)

ggplot(aman12, aes(reorder(aman12$device, aman12$region), aman12$region)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#11. graphically analyzing the answering of questions in online session and understanding of lessons in online session
#linear regression can be applied

library(ggplot2)

ggplot(aman12, aes(reorder(aman12$answering.question, aman12$understanding.online), aman12$understanding.online)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))


#12. graphically analyzing obesity and joint pain
#linear regression can be applied

library(ggplot2)

ggplot(aman12, aes(reorder(aman12$phi.joint, aman12$phi.obesity), aman12$phi.obesity)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust = 1))

#panel plots of 8 ordinal datatypes
plot(aman12$powercut, col="red")
plot(aman12$hour, col="red")
plot(aman12$device.hunged, col="red")
plot(aman12$answering.question, col="red")
plot(aman12$completing.assignment, col="red")
plot(aman12$submitting.assignment, col="red")
plot(aman12$understanding.online, col="red")
plot(aman12$lab.problem, col="red")


#histogram plots of the ordinal datatypes
hist(as.numeric(aman12$powercut), col="green")
hist(as.numeric(aman12$hour), col="green")
hist(as.numeric(aman12$device.hunged), col="green")
hist(as.numeric(aman12$answering.question), col="green")
hist(as.numeric(aman12$completing.assignment), col="green")
hist(as.numeric(aman12$submitting.assignment), col="green")
hist(as.numeric(aman12$understanding.online), col="green")
hist(as.numeric(aman12$lab.problem), col="green")

#boxplot analysis on ordinal datatypes
boxplot(as.numeric(aman12$V19), as.numeric(aman12$V21), as.numeric(aman12$V26), as.numeric(aman12$V27), as.numeric(aman12$V28), as.numeric(aman12$V29), as.numeric(aman12$V30), as.numeric(aman12$V31))



#scatter plot on correlated items
plot(aman12$V28, aman12$V29)
plot(aman12$V27, aman12$V30)
plot(aman12$V21, aman12$V27)

#applying linear regression on correlated data types

#doing assignment on time(aman12$V28) and submission of assignment on time(aman12$V29)
rel<-lm(as.numeric(aman12$submitting.assignment)~as.numeric(aman12$completing.assignment))
print(summary(rel))
a<- data.frame(X = 1)
predict(rel, a)
plot(aman12$submitting.assignment, aman12$completing.assignment)
abline(lm(as.numeric(aman12$completing.assignment)~as.numeric(aman12$submitting.assignment)))


#answering question in online session(aman12$V27) and understanding in online session(aman12$V30)
rel1<-lm(as.numeric(aman12$V27)~as.numeric(aman12$V30))
print(summary(rel1))
b<- data.frame(X = 310)
predict(rel1, b)
plot(aman12$V27, aman12$V30)
abline(lm(as.numeric(aman12$V27)~as.numeric(aman12$V30)))


# time spend in online session(aman12$V21) and #answering question in online session(aman12$V27)
rel2<-lm(as.numeric(aman12$V21)~as.numeric(aman12$V27))
print(summary(rel2))
d<- data.frame(X = 310)
predict(rel2, d)
plot(aman12$V21, aman12$V27)
abline(lm(as.numeric(aman12$V21)~as.numeric(aman12$V27)))


#13. applying decision tree algorithm on health aspect and hours spent on online lectures
aman13 <- read.csv("E:/aman/studentonlinestudy/aman13.csv")
 View(aman13)
library(rpart)
 library(rpart.plot)
 tree <- rpart(hour~phi.ear+phi.eye, aman13)
 a<- data.frame(phi.ear=c("no","yes", "no"), phi.eye=c("yes", "no", "yes"))
 result <- predict(tree, a)
 print(result)
 rpart.plot(tree) 

 
 
 library(rpart)
 library(rpart.plot)
 tree <- rpart(phi.eye ~ phi.joint + phi.obesity, aman13)
 a<- data.frame(phi.joint = c("yes"), phi.obesity = c("yes"))
 result <- predict(tree, a)
 print(result)
 rpart.plot(tree)

 
str(aman12)
summary(aman12)


 



