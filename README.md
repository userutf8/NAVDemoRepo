# NAVDemoRepo
NAV Demos
Here's a sample demo.

INSTALLATION
1. Download the files and store them in a folder
2. Open the folder in VS Code (you need VS Code with AL Extension)
3. Update app.json to work with your NAV version:
  "platform": "14.0.38155.0",
  "application": "14.7.0.0"
  must be replaced by your version of platform and application, e.g.
    "platform": "11.0.0.0",
    "application": "11.0.0.0"
  platform and app version are retrieved from NAV
 4. Ctrl + Shift + P in VS Code and run AL: download symbols and select the server
 5. It creates launch.json and most likely complains that it cannot download symbols.
 If you use Windows Authentication (simplest), then just change string as follows
 "authentication": "Windows"
 6. run download symbols again, now it must download
 7. Ctrl + Shift + P and Publish and open in the designer
 
 SCENARIOS
 1. Create new Customer from Domestic template
 2. extension suggests to create a Contragent, say 'yes'
 3. Customer card is opened, and Contragent Card is opened in the background
 4. close Customer card: now you see Contragent Card with Domestic Cust Posting group and empty vendor
 5. update Vendor in the Contragent card and close it
 6. search for Contragents list and open it: you can see your record
 7. make a new record and try to select same customer/vendor, you'll get an error.
 
