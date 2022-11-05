# Creating the data frame
Name = c("Sam","Kane","Jane","Anne","Sammie")
Age = c(23,21,24,25,20)
Gender = c("Male","Male","Female","Female","Female")
Marks = c(78,58,30,85,90)

df = data.frame(Name,Age,Gender,Marks)

# removing primary key column
df$Name = NULL

df$Gender = factor(df$Gender)
df$Gender
contrasts(df$Gender)

# average marks
mean(df$Marks)

# add 5 marks to student and calculate average again
df$Marks = df$Marks + 5
df$Marks
mean(df$Marks)

# change age of Jane
df$Age[3] = 22
df$Age

# new column pass fail
df$Results = ifelse(df$Marks >= 50, "Pass", "Fail")
df$Results

# summary
summary(df)

# split male and female
# right side of comma is blank to get all columns
df_male = df[df$Gender == "Male",]
df_male

df_female = df[df$Gender == "Female",]
df_female

# summary
summary(df_male)
summary(df_female)
