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
  input <- read.csv(paste(path,file,sep=""))
  #View(input) 
 #plot(input$ip_addr_player_id, in)
 
 freq <- data.frame(table(input$ip_addr_player_id))
 #View(freq)
 counts <- data.frame(table(freq$Freq))
 #View(counts)
 
 library(ggplot2)
 fname <- sprintf("%s.png",file)
 plot <- ggplot(counts, aes(Var1, Freq, fill=Var1))+ geom_bar(stat="identity")+theme(axis.text.x = element_text(angle = 90, vjust=0.5, hjust=0)) + labs(title="Level Count",subtitle="count for every lvl played",
          y="Count", x="Level") + theme(legend.position="none")
 
 savePlot(plot,fname)
 
 }
 

