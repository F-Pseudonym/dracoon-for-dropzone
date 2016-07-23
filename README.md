# dropzone-share-with-sds
Action for Dropzone to easily share files via *SSP Secure Data Space*

## Disclaimer
*Secure Data Space* is a cloud storage product/service by *SSP Europe GmbH* (http://secure-data-space.com). The icon is property of *SSP Europe GmbH*.

## General Information
This action for Dropzone 3 for Mac (https://aptonic.com/) can be used to easily upload files to *SSP Secure Data Space* (*SDS*) and provide a Share Link which is placed in the clipboard. This Share Link can be used to provide the uploaded file(s) to third parties.
If you do not own an account for Secure Data Space you can sign up for a demo account here: https://www.secure-data-space.com/en/data_space_kostenlos_bestellen.php.

## Installation
<a href="https://github.com/F-Pseudonym/dropzone-share-with-sds/releases/latest">Download the latest version</a> of this action and unzip it on your Mac. Click on the action named "Share with SDS.dzbundle" to install it to your Dropzone. You are prompted to immedately add it to the grid.

After adding the action to your grid you need to setup your account and the location your files will be stored.
![Screenshot of Setup Dialogue](http://blog.florian-scheuer.de/wp-content/uploads/2016/07/setup-share-with-sds.png)
Please enter the URL of your *Secure Data Space* Instance (should usually be *https://dataspace.ssp-europe.eu*), your username and your password. In the field *Remote Path* please specify the logical path in your Data Space where your files should be stored. You can select existing and non-existing path elements; new intermediate folders will be created on first usage.
The fields "Port" and "Root URL" are currently not used – you can leave them empty.

## Usage
Simply drag one or more files you'd like to share on the action in your Dropzone grid. The files will be uploaded and a Share Link is automatically created and placed in your clipboard. Simply paste it wherever you need it.

If you hold the Command Key (⌘) or the Option Key (⌥) while releasing your files, an expiry date for the file(s) and the Share Link will be set to 14 days. This will result in Share Link and file(s) to be removed after two weeks from *Secure Data Space*.

By holding the Control Key (^) or the Option Key (⌥) while releasing your files, you will be prompted for a password to protect your Share Link. Please keep in mind that password policies might be enforced.

Simple upload (without creation of share link) of files is possible by holding the Shift Key (⇧) while dropping them on the action icon.

Clicking on the Dropzone action will copy the latest Share Link once more to your clipboard so you might recover it if you accidentally overwrote it already.
