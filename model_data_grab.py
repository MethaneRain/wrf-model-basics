#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun 12 16:14:33 2020

@author: Justin Richling

WRF Model Data Grab Package
---------------------------

This package is set to grab the basic model data for injesting into the
WRF model.

Arguments are date, initialization hour, dynamic number of forecast hours, and model
"""

import sys
date = sys.argv[1]
model = sys.argv[2]
prod = sys.argv[3]

init_hour = sys.argv[4].zfill(2)

f_hour = sys.argv[5].zfill(3)

model_dict = {"Model:{Product:url extension}":"",
                  "gfs":{"quardeg":"gfs.t"+init_hour+"z.pgrb2.0p25.f"+f_hour,
                         "halfdeg":"gfs.t"+init_hour+"z.pgrb2.0p50.f"+f_hour,
                         "fulldeg":"gfs.t"+init_hour+"z.pgrb2.1p00.f"+f_hour,
                         "sflux":"gfs.t"+init_hour+"z.sfluxgrbf"+f_hour+".grib2",
                         "wafs":"gfs.t"+init_hour+"z.wafs_grb45f"+f_hour+".grib2",},

                  "nam":{"":"",},

                  "hrrr":{"":"",},

                  "rap":{"":"",},

                  "sref":{"":"",},
                  }

url = model_dict[model][prod]
sys.stdout.write(url)
sys.exit(0)
