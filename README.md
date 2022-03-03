# AIO WordPress Security Scan Script
All in one WP CLI Security Scanning Script incorporating WP Scan and OWASP ZAP

### Dependencies: Docker

Ensure that you have installed and started Docker before use: https://docs.docker.com/desktop/

Download the included shell script file and run `chmod +x securityscanpackage.sh` on it. You can execute by simply referring to it in terminal: `./securityscanpackage.sh`

This script will pull required Docker images and run an OWASP ZAP scan against targets with standard options and only provide an output if any significant findings are discovered. It will then use WP Scan for a WordPress specific audit. You will be given an option to enter a WP Scan API token. 

You can get a free API token with 25 daily requests by registering at https://wpscan.com/register/
