#Problem 2

#This is an analysis of the relationship between the length of house-elves' 
#ears and aspects of their DNA

Elf = read.csv("data/houseelf_earlength_dna_data_1.csv", header = TRUE)

#Problem 6

library(stringr)

#Calculate GC content
gc_content <- function(sequence){
  dnaseq <- str_to_upper(sequence)
  Gs <- str_count(dnaseq, 'G')
  Cs <- str_count(dnaseq, 'C')
  gc <- (Gs + Cs) / str_length(dnaseq) * 100
  return(gc)
} 

get_size_class <- function(seq){
   #Calculate the GC-content for one or more sequences
   ear_lengths <- ifelse(seq > 10, "large", "small")
   return(ear_lengths)
}
