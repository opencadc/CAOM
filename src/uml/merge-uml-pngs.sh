#!/bin/bash

## complete list
#convert -append CAOM1core.png CAOM2datatypes.png CAOM3wcs.png CAOM4entities.png CAOM5vocabularies.png \
	draft-CAOM-2.5.png

## only changes
convert -append CAOM1core.png CAOM4entities.png CAOM5vocabularies.png \
        draft-CAOM-2.5.png

