library(AzureStor)

file_service <- "https://mystorageaccountnname.file.core.windows.net/"
access_key <- ""

# create files share
endp <- file_endpoint(file_service, key=access_key)
create_file_share(endp, "mtcars")

# list shares
list_file_shares(endp)

# upload file
share <- file_share("https://mystorageaccountname.file.core.windows.net/mtcars",
                    key=access_key)

upload_azure_file(share, "mtcars.csv") # overwrites existing

# download file
# overwrite = F by default
download_azure_file(share, "mtcars.csv","mtcars2.csv")

# list files
list_azure_files(share)


# Blob storage
# endp <- storage_endpoint(file_service, key=access_key)
# cont <- storage_container(endp, "first")
# 
# list_azure(cont)
# 
# storage_download(cont, "iris.csv", "local_filename.csv")
# storage_upload(cont,"mtcars.csv")

