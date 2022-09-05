#!/bin/bash

# © Copyright IBM Corporation 2018.
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v2.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v20.html

if [ -z "$MQSI_VERSION" ]; then
  source /opt/ibm/ace-12/server/bin/mqsiprofile
fi

if ls /home/aceuser/initial-config/mybars/*.bar >/dev/null 2>&1; then
  for bar in /home/aceuser/initial-config/mybars/*.bar
  do
	mybar=$(basename -- "$bar")
	myprop=".properties"
	myprop=$bar$myprop
    mqsiapplybaroverride -b $bar -p $myprop -r -o /home/aceuser/build/$mybar
    mqsibar -a /home/aceuser/build/$mybar -w /home/aceuser/ace-server
  done
fi
