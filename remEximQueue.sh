#!/bin/bash

for mid in `exim -bp | grep "${1}" | awk '{print $3}' | perl -p -e 's/^\n//g'`; do for pid in `ps auxf | grep "${mid}" | grep -v 'grep' | awk '{print $2}'`; do kill -9 ${pid}; done; exim -Mrm ${mid}; done;
