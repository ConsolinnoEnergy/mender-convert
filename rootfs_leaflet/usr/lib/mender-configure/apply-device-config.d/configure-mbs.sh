#!/bin/bash

# @file mender-inventory-fwdata
# @author A.Pietsch <a.pietsch@consolinno.de>
# @brief Mender Configure Script for Base Software
# @version 0.1
# @date 2021-07-01
# 
# @copyright Copyright (c) 2021 Consolinno Energy GmbH
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.



# This script configures the leaflet Base Software via Mender.io  

if [ $# -ne 1 ]; then
    echo "Must be invoked with exactly one argument: The JSON configuration." 1>&2
    exit 2
fi

CONFIG="$1"

if ! [ -e "$CONFIG" ]; then
    echo "Error: $CONFIG does not exist." 1>&2
    exit 1
fi

# MBS NAME ####################################################################
MBSNAME="$(jq -r -e .mbsname < "$CONFIG")"
return_code=$?

case $return_code in
    0)
        sed -i 's/Name=".*"/Name="'$MBSNAME'"/' /usr/etc/LeafletBaseSoftware/Leaflet.conf


        ;;
    1)
        # Result was null, there is no timezone configuration, nothing to do.
        echo "No mbsname configuration found."
        ;;
    *)
        exit $return_code
        ;;
esac

# MBS LOCATION ################################################################
LOCATION="$(jq -r -e .mbslocation < "$CONFIG")"
return_code=$?

case $return_code in
    0)
        sed -i 's/Location=".*"/Location="'$LOCATION'"/' /usr/etc/LeafletBaseSoftware/Leaflet.conf
        ;;
    1)
        # Result was null, there is no timezone configuration, nothing to do.
        echo "No msblocation configuration found."
        ;;
    *)
        exit $return_code
        ;;
esac

# MBS IP ################################################################
IP="$(jq -r -e .mbsip < "$CONFIG")"
return_code=$?

case $return_code in
    0)
        sed -i 's/IP=".*"/IP="'$IP'"/' /usr/etc/LeafletBaseSoftware/Leaflet.conf
        ;;
    1)
        # Result was null, there is no timezone configuration, nothing to do.
        echo "No mbs Ip configuration found."
        ;;
    *)
        exit $return_code
        ;;
esac

# MBS Port ################################################################
PORT="$(jq -r -e .mbsport < "$CONFIG")"
return_code=$?

case $return_code in
    0)
        sed -i 's/Port=".*"/Port="'$PORT'"/' /usr/etc/LeafletBaseSoftware/Leaflet.conf
        ;;
    1)
        # Result was null, there is no timezone configuration, nothing to do.
        echo "No mbs Port configuration found."
        ;;
    *)
        exit $return_code
        ;;
esac


# MBS Port ################################################################
MAXCON="$(jq -r -e .mbsmaxcon < "$CONFIG")"
return_code=$?

case $return_code in
    0)
        sed -i 's/MaxConnections=".*"/MaxConnections="'$MAXCON'"/' /usr/etc/LeafletBaseSoftware/Leaflet.conf
        ;;
    1)
        # Result was null, there is no timezone configuration, nothing to do.
        echo "No mbsmaxcon configuration found."
        ;;
    *)
        exit $return_code
        ;;
esac

exit 0



