#!/bin/bash
docker run -v "$PWD":"$PWD" -a stdout -a stderr -w "$PWD" parente/tott-media ./convert.py $@
