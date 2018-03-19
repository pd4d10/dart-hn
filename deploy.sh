#!/bin/bash

# https://github.com/isoos/pwa/tree/master/examples/pwa_defaults#pwa-worker
pub run pwa
pub build

cp now.json build/web/
now --public deploy build/web/
now alias
