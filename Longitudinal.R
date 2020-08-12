rm(list=ls())
dev.off()
pacman::p_load(pacman, rio)
# IMPORTING Data ###########################################################
data <- import("/Users/jinghangli/Desktop/Pitt Summer 2020/KLU_APC2_Master_2020_07_01.xlsx")
# Filter Data ##############################################################
n_occur <- data.frame(table(data$Vault_UID)) #getting the subject ID and the corresponding recurrence 
data_multiple_visit <- data[data$Vault_UID %in% n_occur$Var1[n_occur$Freq > 1],] #getting the data with the multiple fMRI scans

list <- data.frame(data_multiple_visit$Vault_UID,data_multiple_visit$Vault_Scan_ID) #getting the subject and scan ID of the participants that have multiple fMRI scans
write.table(list, "list.txt",sep="/",row.names = FALSE,col.names = FALSE) #exporting the list to txt file
