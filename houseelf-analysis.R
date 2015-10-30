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

#Problem 7

#Break down Elf table
ElfID = Elf[["id"]]
Elfear = Elf[["earlength"]]
ElfDNA = Elf[["dnaseq"]]

get_size_class <- function(seq){
   #Designate ear length as Large or Small
   ear_lengths <- ifelse(seq > 10, "large", "small")
   return(ear_lengths)
}

#Create table with GC content values
GC_output <-data.frame()
for(row in ElfDNA){
  GC <- gc_content(row)
  total_GC <- data.frame(GC)
  GC_output <- rbind(GC_output, total_GC)
}

#Create table with large and small values
size_output <-data.frame()
for(row in Elfear){
  LorS <- get_size_class(row)
  total_LorS <- data.frame(Ear_length = LorS)
  size_output <- rbind(size_output, total_LorS)
}

elf.df = data.frame(ElfID, size_output, GC_output)

write.csv(elf.df, file = "house_elf_data.csv")

