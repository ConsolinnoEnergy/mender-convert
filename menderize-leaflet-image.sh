#!/bin/bash
MENDER_ARTIFACT_NAME=release-1 ./mender-convert \
   --disk-image input/image_2021-05-31-consolinno-buster-lite.zip \
   --config configs/leaflet_config \
   --overlay rootfs_leaflet/
