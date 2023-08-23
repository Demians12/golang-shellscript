# Go Installation Script
This script automates the installation or update process of the Go programming language for Linux and macOS systems. It's designed to simplify the setup process for developers, ensuring that the desired version of Go is installed on the system.

# Features
- Checks Existing Installation: The script first checks if Go is already installed on the system.
- Version Comparison: If Go is installed, the script compares the installed version with the desired version specified in the script.
- Installation or Update: If Go is not installed, or if the installed version is different from the desired version, the script proceeds to install or update Go.
- For macOS, it uses Homebrew to install or update Go.
- For Linux, it downloads the Go tarball from the official website and extracts it to /usr/local, updating the PATH environment variable accordingly.
- Version Verification: After installation or update, the script prints the installed version of Go to verify that the process was successful.

# Usage
- Download the Script: Download the script file to your local system.
- Make it Executable: Run chmod +x /path/to/script.sh to make the script executable.
- Execute the Script: Run the script with /path/to/script.sh.
- Follow the Prompts: The script will prompt you to enter your operating system (either 'linux' or 'mac'). Enter the appropriate value and the script will handle the rest.

# Requirements
- macOS: Homebrew must be installed.
- Linux: wget must be available for downloading the Go tarball.
Note
 
This script is intended for use on Linux and macOS systems only. If you're using a different operating system, please refer to the official Go installation instructions.

# How to run
- run the following comands: <br>
```bash
chmod +x ./install_go.sh
./install_go.sh
```
- You will be prompted to enter your operating system (mac or linux):
`Please enter your operating system (linux/mac): `
