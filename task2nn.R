savePlot <- function(myPlot,fname) {
  png(fname)
  print(myPlot)
  dev.off()
}



 library(readr)
path <- "E:\\fifth week\\csv_output\\"
files <- list.files(path = path, pattern="*.csv")
#files
for(file in files)
 {
   Inpdata <- read.csv(paste(path,file,sep=""))

 #Inpdata <- read.csv("E:\\fifth week\\csv_output\\JavaScript-Log_2016-07-05_064119_2016-07-19_064119.json_csv.csv")
  #View(Inpdata)
  #get unique_id
  players <- unique(Inpdata$ip_addr_player_id)
  #View(players)
  library(data.table)
  library(ggplot2)
  for(i in players){
   #print(i)
     
    # filename for plots
    save_name = paste(file,i,sep="")
    
   #select rows for uniq ip_addr_player_id

   index= which(Inpdata$ip_addr_player_id == i)

   #get dataframe of the coresponding index

   p1=Inpdata[index,]

  # print(p1)

   #get dataframe

   DT <- data.table(p1)

   #print(DT)

   dt1 <- DT[, points_earned, by = level]
  fname <- sprintf(path,"%s.png",i)

  graph <- ggplot(dt1, aes(level, points_earned, fill=points_earned))+ geom_bar(stat="identity")+theme(axis.text.x = element_text(angle = 90, vjust=0.5, hjust=0))+labs(title= i ,y="Count", x="Level")

   savePlot(graph,fname)

  }
}
