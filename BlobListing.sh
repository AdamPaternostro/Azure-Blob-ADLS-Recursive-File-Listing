#!/bin/bash

# NOTE: 
# Install Azure CLI
# Run: az login
# You need access to the storage account
# You will get Tab Deliminated files with 5000 rows in each

storageAccountName="REPLACE-ME"
containerName="REPLACE-ME"


i=1
filename=$(printf "%05d-blob-listing.tsv" $i)

echo "Getting Listing $i"
nextMarker=$({ az storage blob list \
    --account-name $storageAccountName \
    --container-name $containerName \
    --auth-mode login \
    --query "[][name, properties.contentLength]" \
    --output tsv > $filename | sed s/Output/Useless/ > outfile; } 2>&1)


while [ ! -z "$nextMarker" ]; do
  i=$((i+1))
  filename=$(printf "%05d-blob-listing.tsv" $i)
  echo "Getting Listing $i"
  echo ""
  echo $nextMarker
  echo ""
  marker=${nextMarker:14}
  length=$(echo ${#marker})
  echo "Length: $length"
  index=$((length-1))
  marker=${marker:0:$index}

  nextMarker=$({ az storage blob list \
    --account-name $storageAccountName \
    --container-name $containerName \
    --auth-mode login \
    --query "[][name, properties.contentLength]" \
    --marker "$marker" \
    --output tsv > $filename  | sed s/Output/Useless/ > outfile; } 2>&1)
done
