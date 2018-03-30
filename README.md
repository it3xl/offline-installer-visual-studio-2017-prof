# Offline Installer for Visual Studio 2017 Professional

This project automates all steps described in **[Install Visual Studio 2017 on low bandwidth or unreliable network environments](https://docs.microsoft.com/en-us/visualstudio/install/install-vs-inconsistent-quality-network)** 

**Tip:** You can easily change this project to work with any edition of Visual Studio 2017.

## How to use
* Download this GitHub project on a machine with unrestricted internet access.
* Run **[create-update offline packages.bat ](https://github.com/it3xl/offline-installer-visual-studio-2017-prof/blob/master/create-update%20offline%20packages.bat)**
* All Visual Studio install packages will be downloaded in a few hours. That's about 35 GB.
* Wait until it ends.
* Copy everything to the target machine without the internet or with restricted internet access.
* Run there **[install VS 2017 Prof.bat ](https://github.com/it3xl/offline-installer-visual-studio-2017-prof/blob/master/install%20VS%202017%20Prof.bat)**.
* This will install [required Microsoft certificates](https://docs.microsoft.com/en-us/visualstudio/install/install-certificates-for-visual-studio-offline) and start Visual Studio 2017 installation. 



