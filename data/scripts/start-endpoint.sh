#!bin/bash

DBPREP=0

if [ $DBPREP -eq 1 ]
	then
		echo "wait for mysql to create initial DB\Users"
		sleep 10

	        echo "DB preparation..."
        	cd /opt/tigase/tigase-server; ./scripts/db-create-mysql-v2.sh

	        echo "sleeping process"
        	sleep infinity
	else
		echo "Starting Tigase XMPP Server...";
		cd /opt/tigase/tigase-server/scripts ; ./tigase.sh run /opt/tigase/tigase-server/etc/tigase.conf
fi


