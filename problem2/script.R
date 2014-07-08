tab <- read.table("~/git/analise-dados-1/problem2/atividade-maquinas-dsc.txt", header=T, quote="\"")

tab_ociosa <- subset(tab, ociosa == TRUE)

tab_not_ociosa <- subset(tab, ociosa == FALSE)

tab_maq_ociosa <- aggregate(tab_ociosa$intervalo, by=list(tab_ociosa$maquina, tab_ociosa$laboratorio), FUN=median)
colnames(tab_maq_ociosa) <- c("maquina", "laboratorio", "intervalo_ocioso")

tab_maq_not_ociosa <- aggregate(tab_not_ociosa$intervalo, by=list(tab_not_ociosa$maquina, tab_not_ociosa$laboratorio), FUN=median)
colnames(tab_maq_not_ociosa) <- c("maquina", "laboratorio", "intervalo_ocupado")

tab_maq_intervalos <- merge(tab_maq_ociosa, tab_maq_not_ociosa)

tab_lab_ociosa <- aggregate(tab_maq_intervalos$intervalo_ocioso, by=list(tab_maq_intervalos$laboratorio), FUN=median)
colnames(tab_lab_ociosa) <- c("laboratorio", "intervalo_ocioso")

tab_lab_not_ociosa <- aggregate(tab_maq_intervalos$intervalo_ocupado, by=list(tab_maq_intervalos$laboratorio), FUN=median)
colnames(tab_lab_not_ociosa) <- c("laboratorio", "intervalo_ocupado")

tab_lab_intervalos <- merge(tab_lab_ociosa, tab_lab_not_ociosa)

tab_maq_intervalos_order_ocioso <- tab_maq_intervalos[order(tab_maq_intervalos$intervalo_ocioso, decreasing=TRUE),]
tab_maq_intervalos_order_not_ocioso <- tab_maq_intervalos[order(tab_maq_intervalos$intervalo_ocupado, decreasing=TRUE),]

?