getwd()
setwd("~/carlos/PNAD")
dir_pnad <- getwd()

library(PNADcIBGE)

ano_vigente <- timeDate::getRmetricsOptions("currentYear") # pega o ano vigente

anos <- 2012:ano_vigente # desde 2012, segundo a documentacao

for (ano in anos) {
  if (ano == 2018 | ano == 2017) {
    #dadosPNADc_anual <- get_pnadc(year = 2018, interview = 1, savedir = tempdir())
    dir_download <- paste(dir_pnad, "download", ano, sep = "/")
    if (!dir.exists(dir_download)) {
      dir.create(dir_download)
    }
    
    dadosPNADc_anual <- get_pnadc(year = ano, interview = 1, savedir = dir_download)
    arqus_excluir <- list.files(dir_download, recursive = FALSE, pattern = "zip$")
    file.remove(paste0(dir_download, "/", arqus_excluir))
    
  }
  
}

# read_pnadc(microdata, input_txt, vars = NULL)
setwd('./download')
pn_2018 <- read_pnadc("2018/PNADC_2018_visita1.txt", "2018/Input_PNADC_1_visita_2018_20191016.txt")
pn_2017 <- read_pnadc("2017/PNADC_2017_visita1.txt", "2017/Input_PNADC_1_visita_2017_20191016.txt")

