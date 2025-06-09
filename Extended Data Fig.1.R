library(forestplot)
library(dplyr)

data <- forest_plot_subgroup_analysis_significant_sepsis

## The rest of the columns in the table. 
tabletext <- cbind(c("","Variables",data$variate),
                   c("no. (%)            ","Rifaximin         ",data$event_rifaximin),
                   c(""," Non-Rifaximin",data$event_non_rifaximin),
                   c("","HR (95% CI)",data$HR)
)

pdf(file.path(workdir,"forest plot_subgroup analysis_significant_sepsis.pdf"),  onefile=FALSE, width=8, height=5)

forestplot(labeltext=tabletext, 
           graphwidth = unit(45, 'mm'),
           graph.pos=4,
           is.summary=c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE),
           mean=c(NA,NA,data$mean), 
           lower=c(NA,NA,data$lower), upper=c(NA,NA,data$upper),
           xticks=c(0.5,0.6,0.7,0.8,0.9,1,2,3,4),
           xlog = TRUE,
           xlab="Hazard ratio (95% CI)", ##name of x axis
           
           #### Add horizontal lines on the plot
           hrzl_lines=list("2" = gpar(lwd = 0.9, lty=1, col='black', columns = c(2:3)),
                           "3" = gpar(lwd = 0.9, lty=1, col='black'),
                           "6" = gpar(lwd = 0.9, lty=5, col='black'),
                           "10" = gpar(lwd = 0.9, lty=5, col='black'),
                           "14" = gpar(lwd = 0.9, lty=5, col='black')
           ),
           
           txt_gp=fpTxtGp(label=list(gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9)),
                          ticks=gpar(cex=0.7),
                          xlab=gpar(cex=0.7,col='black',fontface='bold'),
                          #xlab=gpar(cex = 1.8),
                          title=gpar(cex = 1.1)),
           
           col=fpColors(box="black", lines="black", zero = "darkgrey"),
           align = "lrrc",
           lwd.zero = 001,
           lwd.xaxis = 0.7,
           mar = unit(c(0,0,0,0), "mm"),
           zero=1, cex=0.01, lineheight = unit(6.5, "mm"), boxsize=0.2, colgap=unit(3,"mm"),
           lwd.ci=0.8, ci.vertices=TRUE, ci.vertices.height = 0.3) 

dev.off()
