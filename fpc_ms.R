#Mouse FPC
#Fibrocystin G8________________________________________________________________#
sp.WT1 <- Spectra("../mzML_files/JUN3659-S02-A-C1_cilia_BIOID2_WT_1.mzML")#WT PC
sp.KO1 <- Spectra("../mzML_files/JUN3659-S03-A-C7_cilia_BIOID2_DLG1KO_1.mzML") #KO PC
table(msLevel(sp))  #MS levels
ms2<-as_tibble(spectraData(filterMsLevel(sp, msLevel = 2)))

#Plot- max m/z= ~1500
raw_ms.plot<-ggplot(data = ms2, mapping = aes(x = basePeakMZ, y = basePeakIntensity)) +
  geom_line()
#______________________________________________________________________________#
#Target peptide

g8<-"HSWFPQRVPHDGDSVTVETGHLLLLDANTSFLNSLHIKGGKLIFMDPGPIELRAHSILITDGGELHIGSEEKPFQGKARIKIYGSVHSTPFFPYGVKFLAVRNGTLSLHGSVPEVTVTYLQA"
#^^^^G81 domain
#isotopic mass
g8.mass<-MonoisotopicMass(formula = list(C=611, 
                                         H=945, 
                                         N=163, 
                                         O=172,
                                         S=1), charge = -1)
g8.mass
g8.mz<-g8.mass/2
g8.mz
#G8 domain m/z >1500
#cleave peptide with trypsin
peptides <- cleave(g8, 
                   enzym = "trypsin", 
                   missedCleavages = 0)
peptides

g8.1<-"HSWFPQR"
g8.1_mass<-MonoisotopicMass(formula = list(C=45, 
                                           H=60, 
                                           N=14, 
                                           O=10,
                                           S=0), charge = 1) #obtain mass from expasy
#_______________________________________________________________________________
#target=g8.1
target<-as.numeric(g8.1_mass/2)
tol<-1
sel_pept<-ms2%>%
  filter(precursorMz > (target - tol),
         precursorMz < (target + tol))
g8.1_ms_plot<-ggplot(data = sel_pept, 
                     mapping = aes(x = basePeakMZ, y = basePeakIntensity)) +
  geom_line()
#chose peak at 272.1281
#scan_index=24972
sl<-sp[24972]
sl<-spectraData(sl)
#_______________________________________________________________________________
