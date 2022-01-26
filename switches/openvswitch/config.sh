#!/bin/sh

if [ ! -f "/etc/openvswitch/conf.db" ]
then
  ovsdb-tool create /etc/openvswitch/conf.db /usr/share/openvswitch/vswitch.ovsschema

  ovsdb-server --detach --remote=punix:/var/run/openvswitch/db.sock
  ovs-vswitchd --detach  
  ovs-vsctl --no-wait init
 
  ovs-vsctl add-br br0
  ovs-vsctl set bridge br0 datapath_type=netdev

  until [ $x = "16" ]; do
    ovs-vsctl add-port br0 eth$x
    ovs-vsctl set interface eth$x ofport_request=$x
    x=$((x+1))
  done
else
  ovsdb-server --detach --remote=punix:/var/run/openvswitch/db.sock
  ovs-vswitchd --detach
fi

# Set bridge br0 IP address and default route
ip link set br0 up
ip addr flush dev br0
ip addr add $BR0_ADDRESS dev br0
ip route add default dev br0

# Set controller TCP connection
ovs-vsctl set bridge br0 other-config:datapath-id=$DATAPATH_ID
ovs-vsctl set-controller br0 tcp:$CONTROLLER_IP:6653 tcp:$CONTROLLER_IP:6654
ovs-vsctl set bridge br0 fail-mode=secure
