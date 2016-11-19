export SL_USERNAME=<YOUR_ACCOUNTID_HERE>
export SL_API_KEY=<YOUR_KEY_HERE>

slcli ticket list \
  awk '{print $1}' \
  grep '[0-9]'|\
  while read ticketid
    do 
      slcli ticket detail "$ticketid"|grep -E 'sorry|apologize|fault'
    done
