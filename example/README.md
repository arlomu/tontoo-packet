tontoo-package
A simple Tontoo package This serves as a great example for creating your own reusable Tontoo modules.

Installation
To install this package in your Tontoo project, add it to your tontoo.json dependencies and then run tontoo install.

Alternatively, you can manually install it if the central registry is not used:

tontoo install https://github.com/your-username/tontoo-joke-package


Usage
Once installed, you can load the package and use its functions in any of your .tont files.

# Load the package
load:
{
  package
}


Included Files
package.tont: Contains the main Tontoo logic and functions.

README.md: This file, providing documentation for the package.