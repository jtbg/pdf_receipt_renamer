#!/bin/bash

# header row for the CSV file
echo "Date,Vendor,Total" >>receipts.csv

for file in *.pdf; do
  # Convert PDF to plain text
  pdftotext "$file" "${file%.pdf}.txt"

  raw_date=$(awk '/[0-1][0-9]\/[0-3][0-9]\/2022/ {print $1}' "${file%.pdf}.txt")
  formatted_date=$(date -d "$raw_date" +%Y-%m-%d)

  # URLs, excluding emails
  vendor=$(awk '/[a-zA-Z]+\.co/ && !/@/ {print $1}' "${file%.pdf}.txt")

  # dollar amounts, excluding negatives. Grab only the last one in the document
  total=$(awk '/\$[0-9]+/ && !/^-/ {print substr($1,2)}' "${file%.pdf}.txt" | sort -rn | tail -1)

  # Rename PDF and append to CSV
  mv "$file" "${formatted_date}_${vendor}_${total}.pdf"
  echo "$formatted_date,${vendor},$total" >>receipts.csv

  # Delete text file
  rm "${file%.pdf}.txt"
done
