packages<-c("mzR","tidyverse","mzID","purrr","limma","dplyr",
            "EnhancedVolcano")
base::lapply(packages,
             base::library, 
             character.only = TRUE)
#<---Pre-processing---------------
#<--START here .mzid file--->
#1.
mzid_parse<-function(mzid_file_path){
  
  parsed_mzID<-mzID::mzID(mzid_file_path)
  
  return(parsed_mzID)
}
#2.
#<-- flatten parsed .mzid --->

flatten_parsed_mzid<-function(parsed_mzid_file_path_or_obj,
                              sample_name){
  flattened_mzid<-mzID::flatten(parsed_mzid_file_path_or_obj)
  flattened_mzid%>%
    dplyr::mutate(sample=sample_name)
  
  return(flattened_mzid)
}

#3.
#<---combine all flattened mzids and obtain peptide spectrum matches (psms)--->
generate_psm_counts<-function(...){
  #<---...=object for each flattened mzid--->
  combined_mzid_across_samples<-dplyr::bind_rows(...)
  psm_counts<-combined_mzid_across_samples %>%
    dplyr::count(accession, sample) %>%
    tidyr::pivot_wider(names_from = sample,
                       values_from = n,
                       values_fill = 0)
  return(psm_counts)
}
#--------END here: psm file--------------------->

#limma analysis to obtain DEG table<--------------------------------
generate_deg_with_limma<-function(psm_counts,
                                  meta_data,
                                  formula,
                                  levels,
                                  expression){
  #<--expression is like KO-WT--->
  #<---only counts no strings--->
  formula<-as.formula(formula)
  intensity_matrix<-base::as.matrix(log2(psm_counts+1))
  design<-base::model.matrix(formula)
  colnames(design)<-levels
  fit<-limma::lmFit(intensity_matrix,design)
  contrast_matrix<-limma::makeContrasts(expression,
                                 levels=design)
  fit2<-limma::contrasts.fit(fit,contrast_matrix)
  fit2<-limma::eBayes(fit2)
  deg_table<-topTable(fit2,adjust="fdr",number=Inf)
  return(deg_table)
  #<---remember to re-add the protein id column--->
}
#<---------gene set enrichment--------------->
gseago.fn<-function(deg_table,gene_col_name,fc_col,organism,
                    p_value_cutoff){
  library(clusterProfiler)
  library(enrichplot)
  library(ggplot2)
  library(org.Mm.eg.db)
  library(org.Hs.eg.db)
  geneList <- deg_table[[fc_col]]
  names(geneList) <- deg_table[[gene_col_name]]
  #<---can change p-value from 0.05--->
  gse <- clusterProfiler::gseGO(geneList=sort(geneList,
                             decreasing = TRUE), 
               ont ="ALL", 
               keyType = "SYMBOL", 
               nPerm = 10000, 
               minGSSize = 3, 
               maxGSSize = 800, 
               pvalueCutoff = p_value_cutoff, 
               verbose = TRUE, 
               OrgDb = organism, 
               pAdjustMethod = "none")
  return(list(go.obj=gse))
}
