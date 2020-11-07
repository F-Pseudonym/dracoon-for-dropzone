# DRACOON for Dropzone
Action for Dropzone to easily share files via *DRACOON*

## Disclaimer
*DRACOON* is a cloud storage product/service by *DRACOON GmbH* (http://dracoon.com). The icon is property of *DRACOON GmbH*.

## General Information
This action for Dropzone 3 and Dropzone 4 for Mac (https://aptonic.com/) can be used to easily upload files to *DRACOON* and create a Download Share which is placed in the clipboard. This Share Link can be used to provide the uploaded file(s) to third parties.
If you do not own an account for DRACOON you can sign up for a free account here: https://www.dracoon.com.

## Installation
<a href="https://github.com/F-Pseudonym/dracoon-for-dropzone/releases/latest">Download the latest version</a> of this action and unzip it on your Mac. Double click on the action named "DRACOON.dzbundle" to install it to your Dropzone. You are prompted to immedately add it to the grid.

After adding the action to your grid you need to setup your account and the location your files will be stored.
![Screenshot of setup dialog](https://florian-scheuer.de/wp-content/uploads/2020/11/setup-dracoon-for-dropzone-2.0.png)
Please enter the URL of your *DRACOON* instance (should usually be *https://dracoon.team*); the fields username and password are not used (however, you need to enter anything in the username field). In the field *Remote Path* please specify the logical path in your DRACOON where your files should be stored. If you leave this free, the action tries to create a default location for you. You can select existing and non-existing path elements; new intermediate folders will be created on first usage (Example: /my files/drop here).
The fields "Port" and "Root URL" are currently not used – you can leave them empty.

## Usage
Simply drag one or more files you'd like to share on the action in your Dropzone grid. The files will be uploaded and a Download Share is automatically created and its link placed in your clipboard. Simply paste it wherever you need it.

If you hold the Command Key (⌘) or the Option Key (⌥) while releasing your files, an expiration date for the file(s) and the Download Share will be set to 14 days. This will result in Download Share and file(s) to be removed after two weeks from *DRACOON*.

By holding the Control Key (^) or the Option Key (⌥) while releasing your files, you will be prompted for a password to protect your Download Share. Please keep in mind that password policies might be enforced.

Simple upload (without sharing) of files is possible by holding the Shift Key (⇧) while dropping them on the action icon.

Clicking on the Dropzone action will copy the latest Share Link once more to your clipboard so you might recover it if you accidentally overwrote it already.