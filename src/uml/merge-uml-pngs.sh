#!/bin/bash

## only changes
pushd src/main/resources
magick CAOM1core.png CAOM2datatypes.png CAOM4entities.png CAOM5vocabularies.png \
        -append draft-CAOM-2.5.png
popd

