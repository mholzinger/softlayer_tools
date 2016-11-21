# Set the slcli user and key externally, or here
#export SL_USERNAME=
#export SL_API_KEY=

slcli server list | awk '{print $1,$2,$5}' | while read server hostname site
do
  echo $hostname [$site] = `curl -u $SL_USERNAME:$SL_API_KEY https://api.softlayer.com/rest/v3/SoftLayer_Hardware_Server/$server/getServerPowerState 2>/dev/null`
done

# Credit goes to my coworker who wrote this script to show servers across regions in a single softlayer account
