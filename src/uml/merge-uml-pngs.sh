#!/bin/bash

## only changes

pushd src/uml

magick CAOM1core.png CAOM2datatypes.png CAOM3vocabularies.png CAOM4entities.png \
        -append ../main/resources/draft-CAOM-2.5.png
popd

