rm(list=ls())       # clear objects in memory
set.seed(220288)   # random number seed, so that results are reproducible
library(foreign)    # package allows R to read Stata datasets
library(dplyr)
library(ri2)        # need this to do complete_ra
library(randomizr)

#Create dataframe of numbered container
assign <- data.frame("containers"=1:32)

#Random assignment of treatment
assign$treat <- complete_ra(32,m_each=c(8,8,8,8)) #T1-3 will be treatment; T4 will be control

#Random assignment of location
assign$loc <- sample(1:32, 32, replace=F)

#Random assignment of taste-test. 1: first sample; 32: last sample.
assign$tt <- sample(1:32, 32, replace=F)

setwd("C:/Users/jacqw/Documents/Columbia/Spring 2019/POS 4768 Experiments/Practicum")
write.csv(assign,"assign.csv",row.names = F)
