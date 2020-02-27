#                 _                                      _        _     ___________ 
#                (_)                                    | |      | |   |_   _| ___ \
#  ___ _ ____   ___ _ __ ___  _ __  _ __ ___   ___ _ __ | |_ __ _| |     | | | |_/ /
# / _ \ '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __/ _` | |     | | |  __/ 
#|  __/ | | \ V /| | | | (_) | | | | | | | | |  __/ | | | || (_| | |_____| |_| |    
# \___|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__\__,_\_____/\___/\_|    


metadataURL <- 'https://raw.githubusercontent.com/SmilodonCub/EnvironmentaLIP/master/1MetaTable1_filtered3%20(1).csv'
metadata_DF <- read.csv( metadataURL )

head( metadata_DF )
length( names( metadata_DF ) )

summary( metadata_DF )
dim( metadata_DF )

dataCor <- rcorr(as.matrix( metadata_DF ))
dataCoeff <- dataCor$r
dataP <- dataCor$P

dataCoeff <- cor(metadata_DF, method = c("spearman"), use = 'complete.obs')

corrplot( dataCoeff, method = "circle", tl.pos='n')
palette = colorRampPalette(c("green", "white", "red")) (50)
heatmap(x = dataCoeff, col = palette, symm = TRUE)

ggcorrplot( dataCoeff, tl.cex=0 )

rquery.cormat( metadata_DF )
