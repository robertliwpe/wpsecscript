#!/bin/bash

printf "\r\n\r\n=====================================================================================\r\n\r\n"
printf '\e[1;34m%-6s\e[m' "AIO WordPress Security Scan Script"
printf "\r\n\r\n=====================================================================================\r\n\r\n"
printf "Ensure that you have installed Docker and have it started: \r\n\r\nhttps://docs.docker.com/desktop/\r\n\r\n"
printf "This script will run an OWASP ZAP scan against targets with standard options and\r\n provide an output if any significant findings are found"
printf "\r\n\r\nIt will then use WP Scan for a WordPress specific audit. You will be given an option\r\n to enter a WP Scan API token."
printf "\r\n\r\nYou can get a free API token with 25 daily requests by registering at\r\n\r\n https://wpscan.com/register/"
printf "\r\n\r\nThis script will pull required Docker images & sudo user access may be required.\r\n"
printf "\r\n=====================================================================================\r\n"

printf "\r\nIf you have a WP Scan API Token please enter it now otherwise just press ENTER:\r\n"

read wpscanapi

printf "\r\nPlease list out the target URLs with SPACE between:\r\n"

read targetlist

printf "\r\nPlease enter sudo user password if required."

if [[ -z "$wpscanapi" ]]
then
    for t in $targetlist; do printf "\r\n\r\n=====================================================================================\r\n\r\n" && echo TARGET: $t && docker run -i owasp/zap2docker-stable zap-cli --verbose quick-scan --self-contained --start-options '-config api.disablekey=true' $t | grep -v "Logging to /zap/zap.log\|Starting ZAP process with command:\|Started scan with ID\|Scan #0 completed\|Shutting down ZAP\|Running a quick scan for" && docker run -it --rm wpscanteam/wpscan --update --url $t; done
else
     for t in $targetlist; do printf "\r\n\r\n=====================================================================================\r\n\r\n" && echo TARGET: $t && docker run -i owasp/zap2docker-stable zap-cli --verbose quick-scan --self-contained --start-options '-config api.disablekey=true' $t | grep -v "Logging to /zap/zap.log\|Starting ZAP process with command:\|Started scan with ID\|Scan #0 completed\|Shutting down ZAP\|Running a quick scan for" && docker run -it --rm wpscanteam/wpscan --update --url $t --api-token $wpscanapi; done
fi
