#!/bin/bash


function val_ip()
  {
  local  ip=$1
  local  stat=1
  if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]];
  then
  OIFS=$IFS
  IFS='.'
  ip=($ip)
  IFS=$OIFS
  [[ ${ip[0]} -le 255 && ${ip[1]} -le 255  && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
  stat=$?
  fi
  return $stat
  }


echo "############################################################"
echo "#                       "warning"                          #"
echo "# 'Master' nodes start from the ip termination 10          #"
echo "# 'Worker' nodes start from ip termination 20              #"
echo "# The node 'Loadbalancer' start from the termination ip 30 #"
echo "############################################################"

echo "IP Address VM: "
read dip
if val_ip $dip;
then echo "Good";
else
  echo "Layer 8";
fi

echo "Number of master nodes: "
read N_MASTER
echo "Number of worker nodes: "
read N_WORKER

IP_NW=dip
MASTER_IP_START=10
NODE_IP_START=20
LB_IP_START=30



export N_MASTER N_WORKER IP_NW MASTER_IP_START NODE_IP_START LB_IP_START
vagrant up
#echo $IP_NW
#echo $MASTER_IP_START
#echo $NODE_IP_START
#echo $LB_IP_START
#echo $N_MASTER
#echo $N_WORKER
