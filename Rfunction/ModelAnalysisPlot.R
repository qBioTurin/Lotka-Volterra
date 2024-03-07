library(ggplot2)

ModelAnalysisPlot=function(trace_path, Stoch = F, print=T){
  
  trace <- read.csv(trace_path, sep = "")
  
  #Model Analysis plot
  
  Dynamics<-read.csv(trace_path,  sep = "") 
  pl <- ggplot(Dynamics, aes(x= Time))+ 
    geom_line(aes(y= Predator, color = "Predator"))+ 
    geom_line(aes(y= Prey, color = "Prey"))+  
    theme(axis.text=element_text(size = 15, hjust = 0.5), 
          axis.text.x=element_text(angle=+90,vjust=0.5, hjust=1), 
          axis.title=element_text(size=18,face="bold"), 
          axis.line = element_line(colour="black"), 
          plot.title=element_text(size=20, face="bold", vjust=1, lineheight=0.6), 
          legend.title = element_blank(), 
          legend.text=element_text(size=14), 
          legend.position.inside= c(.85, .85), 
          legend.background = element_rect(linewidth=0.5, linetype="solid",  
                                           colour ="black"), 
          legend.key=element_blank(), 
          legend.key.size = unit(.9, "cm"), 
          legend.key.width = unit(.9,"cm"), 
          panel.background = element_rect(colour = NA), 
          plot.background = element_rect(colour = NA), 
          plot.margin=unit(c(0,5,5,5),"mm"), 
          strip.background=element_rect(colour="#f0f0f0",fill="#f0f0f0"), 
          strip.text = element_text(face="bold",size = 15))+ 
    labs(x="Time", y="Populations size" ) 
  
  return(pl)
}
