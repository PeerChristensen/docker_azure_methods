
library(tidyverse)
library(AzureStor)

access_key <- ""
share <- file_share("https://mystorageaccount.file.core.windows.net/iris",
                    key=access_key)

download_azure_file(share, "iris.csv","iris.csv",overwrite=T)

df <- read_csv("iris.csv")

df <- head(df)

write_csv(df, "output.csv")

upload_azure_file(share, "output.csv") # overwrites existing
