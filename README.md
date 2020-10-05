# Azure-Blob-ADLS-Recursive-File-Listing
Gets all the blobs in a container along with their file sizes and saves them to tab delimited  files.  Handles continuation tokens (aka next markers). 

# Requirements
- Azure CLI
- Linux/Bash (or Windows Linux Subsystem)

# Steps
- Install CLI
- Login "az login"
- Set the storageAccountName in the script
- Set the containerName in the script
- You will need to chmod +x BlobListing.sh
- Run: ./BlobListing.sh
- This can take a while....
  - You might want to add a prefix parameter to just get one "folder"
  - https://docs.microsoft.com/en-us/cli/azure/storage/blob?view=azure-cli-latest#az_storage_blob_list 
  - Open in Excel or import to a database