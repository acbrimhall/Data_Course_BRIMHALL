
library(R.matlab)

Female_ADHD <- 
readMat("./Assignments/Assignment_4/Possible_Datasets/EEG/FADHD.mat")
#Raw Female ADHD data

Female_Control <- 
  readMat("./Assignments/Assignment_4/Possible_Datasets/EEG/FC.mat")
#Raw Female Control data

Male_ADHD <- 
  readMat("./Assignments/Assignment_4/Possible_Datasets/EEG/MADHD.mat")
#Raw Male ADHD data

Male_Control <- 
  readMat("./Assignments/Assignment_4/Possible_Datasets/EEG/MC.mat")
#Raw Male Control data


#dat <- as.data.frame(Female_ADHD$FADHD[1:11])
#colnames(dat) <- unlist(FADHD$FADHD)


attributes(Female_ADHD)

dat_FAD<- Female_ADHD$FADHD
dat_FC <- Female_Control$FC
dat_MAD <- Male_ADHD$MADHD
dat_MC <- Male_Control$MC


head(dat_FAD[1,1])
head(dat_FAD[1,2])
head(dat_FAD[1,3])
head(dat_FAD[1,4])
head(dat_FAD[1,5])
head(dat_FAD[1,6])

#options(max.print = .Machine$integer.max) #Allows us to to see the entire data 
#print(dat_FAD[1,1])
#options(max.print = 99999) #Returning to default max print
#options(max.print = 99999)

FAD_1_1 <- head(dat_FAD[1,1])
FAD_1_4 <- head(dat_FAD[1,4])

FAD_1_1_matrix <- as.matrix(unlist(FAD_1_1))

head(dat_FAD[1,1])

matlab::fileparts(Female_ADHD)
structure(Female_ADHD)
structure(dat_FAD)


##An overview of the data##
#Data sampling rate of 256 Hz
  #Means that a sample is taken every 1/256th of a second
    #0.003906 seconds between samples
#79 Total participants
  #42 healthy adults/control
  #37 adults with adhd
  #56 male
  #23 female
#Four different states
  #Resting state with eyes open 
  #Eyes closed
  #Cognitive challenge
  #Listening to omni harmonic
#EEG signals from five channels
  #Letters denote the lobe or region of the brain
    #F=frontal; Fp=frontpolar; T=temporal; C=central;
    #P=parietal; O=occipital; A= auricular (ear)
  #Numbers denote localization within a region or lobe
    #Even numbers refer to the right side of the head
    #Odd numbers refer to the left side of the head
    #A "z" (zero site) instead of a number refers to the midline of the head
      #The midline is considered ground or the common reference point for EEGs
  #O1 (Occipital 1)
  #F3 (Frontal 3)
  #F4 (Frontal 4)
  #Cz (Central midline)
  #Fz (Frontal z)
#dat_group contains a matrix 1 by 11
  #Each cell contains a lists 
    #Each list contains a numerical data set
      #[patients, signal samples, number of channels]
      #One row for each patient 
      #One Column for each signal sample taken within the time frame
      #

#Trail 1: Eyes open baseline,
  #Channels: Cz, F4, 
  #Duration: 30s
#Trail 2: Eyes closed, 
  #Channels: Cz, F4, 
  #Duration: 20s
#Trail 3: Eyes open, 
  #Channels: Cz, F4, 
  #Duration: 20s
#Trail 4: Cognitive challenge, 
  #Channels: Cz, F4, 
  #Duration: 45s
#Trail 5: Pre-Omni harmonic baseline, 
  #Channels: Cz, F4, 
  #Duration: 15s
#Trail 6: Omni harmonic assessment, 
  #Channels: Cz, F4, 
  #Duration: 15s
#Trail 7: Eyes open baseline, 
  #Channels: O1, F4, 
  #Duration: 30s
#Trail 8: Eyes closed, 
  #Channels: O1, F4, 
  #Duration: 30s
#Trail 9: Eyes open, 
  #Channels: O1, F4, 
  #Duration: 30s
#Trail 10: Eyes closed, 
  #Channels: F3, F4, 
  #Duration: 45s
#Trail 11: Eyes closed, 
  #Channels: Fz, F4, 
  #Duration: 45s




