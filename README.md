# pdf_receipt_renamer
a bash script that parses PDF receipts, renames each, and appends their details to a CSV

I made this to save some time uploading FSA receipts at the end of the year.

Dependcy:
If your distro doesn't include `pdftotext`, you'll need to install it. 

Usage:
1. download parse.sh and place it in the same folder as your PDF receipts
2. `chmod +x parse.sh`, which allows the script to be executed
3. `./parse.sh`

You'll likely have to tweak it a bit to make it work with your receipts, but feel free to open an issue if you need help.

![image](https://user-images.githubusercontent.com/10716475/208633118-50169d33-84ae-4e74-a68c-1fbca29913f1.png)

![image](https://user-images.githubusercontent.com/10716475/208633165-aedcae7c-c5b0-4a8a-85f0-ebe838c68399.png)

