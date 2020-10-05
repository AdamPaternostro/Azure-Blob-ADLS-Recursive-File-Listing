# Azure-Blob-ADLS-Recursive-File-Listing
Gets all the blobs in a container along with their file sizes and saves them to tab delaminated files.  Handles continuation tokens (aka next markers). 

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
  - Open in Excel or import to a database