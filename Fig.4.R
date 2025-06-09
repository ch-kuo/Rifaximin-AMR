library(forestplot)
library(dplyr)

data <- forest_plot_main_analysis_significant_3_ABX_use

## The rest of the columns in the table. 
tabletext <- cbind(c("","Follow-up time",data$timepoint),
                   c("no. (%)        ","Rifaximin    ",data$event_rifaximin),
                   c(""," Non-Rifaximin",data$event_non_rifaximin),
                   c("","HR (95% CI)",data$HR)
)

pdf(file.path(workdir,"forest plot_main analysis_significant_3_ABX use.pdf"),  onefile=FALSE, width=8, height=4)

forestplot(labeltext=tabletext, 
           graphwidth = unit(45, 'mm'),
           graph.pos=4,
           is.summary=c(FALSE, FALSE, TRUE, rep(FALSE, 4), TRUE, rep(FALSE, 4), TRUE, rep(FALSE, 4), TRUE, rep(FALSE, 5)),
           mean=c(NA,NA,data$mean), 
           lower=c(NA,NA,data$lower), upper=c(NA,NA,data$upper),
           xticks=c(0.5,0.6,0.7,0.8,0.9,1,2,3,4),
           xlog = TRUE,
           xlab="Hazard ratio (95% CI)", ##name of x axis
           
           #### Add horizontal lines on the plot
           hrzl_lines=list("2" = gpar(lwd = 0.9, lty=1, col='black', columns = c(2:3)),
                           "3" = gpar(lwd = 0.9, lty=1, col='black'),
                           "8" = gpar(lwd = 0.9, lty=5, col='black'),
                           "13" = gpar(lwd = 0.9, lty=5, col='black')
           ),
           
           txt_gp=fpTxtGp(label=list(gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9)),
                          ticks=gpar(cex=0.7),
                          xlab=gpar(cex=0.7,col='black',fontface='bold'),
                          #xlab=gpar(cex = 1.8),
                          title=gpar(cex = 1.1)),
           
           col=fpColors(box="black", lines="black", zero = "darkgrey"),
           align = "lrrr",
           lwd.zero = 001,
           lwd.xaxis = 0.7,
           mar = unit(c(0,0,0,0), "mm"),
           zero=1, cex=0.01, lineheight = unit(5, "mm"), boxsize=0.2, colgap=unit(3,"mm"),
           lwd.ci=0.8, ci.vertices=TRUE, ci.vertices.height = 0.3) 


dev.off()
