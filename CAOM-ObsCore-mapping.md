# CAOM - ObsCore Mapping

This is the standard mapping between CAOM-2.5 and ObsCore-1.2 - both at working draft (WD) stage.

Informative: the standard CAOM table and column names are included below; these will be specified
in a separate standard (CAOM-TAP). The standard rules to generate the relational mapping:
* {model rpefix} -> {schema name}
* {entity class name} -> {table name}
* {vodml-id} -> (dots converted to underscore) -> {column_name} (vodml-id rules TBD)

|CAOM vodml-id|CAOM table|CAOM column|ObsCore table/view|ObsCore column|
|-------------|----------|-----------|------------------|--------------|
|Observation.uri|caom2.Observation|uri|ivoa.ObsCore|obs_id|
|Observation.collection|caom2.Observation|collection|ivoa.ObsCore|obs_collection|
|Telescope.name|caom2.Observation|telescope_name|ivoa.ObsCore|facility_name|
|Instrument.name|caom2.Observation|instrument_name|ivoa.ObsCore|instrument_name|
|Target.name|caom2.Observation|target_name|ivoa.ObsCore|target_name|
|Plane.uri|caom2.Plane|uri|ivoa.ObsCore|obs_creator_did|
||caom2.Plane|publisherID|ivoa.ObsCore|obs_publisher_did|
|Plane.dataRelease|caom2.Plane|dataRelease|ivoa.ObsCore|obs_release_date|
|Plane.dataProductType|caom2.Plane|dataProductType|ivoa.ObsCore|dataproduct_type|
|Plane.calibrationLevel|caom2.Plane|calibrationLevel|ivoa.ObsCore|calib_level|
|||||||
||||ivoa.ObsCore|access_url|
||||ivoa.ObsCore|access_format|
||||ivoa.ObsCore|access_estsize|
|Position.bounds|caom2.Plane|position_bounds|ivoa.ObsCore|s_region|
|--|caom2.Plane|_function_|ivoa.ObsCore|s_ra|
|--|caom2.Plane|_function_|ivoa.ObsCore|s_dec|
|--|caom2.Plane|_function_|ivoa.ObsCore|s_fov|
|Position.resolution|caom2.Plane|position_resolution|ivoa.ObsCore|s_resolution|
|Position.resolutionBounds|caom2.Plane|position_resolutionBounds|ivoa.ObsCore||
|--|caom2.Plane|_function_|ivoa.ObsCore|s_resolution_min|
|--|caom2.Plane|_function_|ivoa.ObsCore|s_resolution_max|
|Position.dimension|caom2.Plane|position_dimension|ivoa.ObsCore||
|--|caom2.Plane|_function_|ivoa.ObsCore|s_xel1|
|--|caom2.Plane|_function_|ivoa.ObsCore|s_xel2|
|||||||
|Energy.bounds|caom2.Plane|energy_bounds|ivoa.ObsCore||
|--|caom2.Plane|_function_|ivoa.ObsCore|em_min|
|--|caom2.Plane|_function_|ivoa.ObsCore|em_max|
|Energy.resolvingPower|caom2.Plane|energy_resolvingPower|ivoa.ObsCore|em_res_power|
|Energy.resolution|caom2.Plane||ivoa.ObsCore|em_resolution|
|Energy.resolutionBounds|caom2.Plane|energy_resolutionBounds|ivoa.ObsCore||
|--|caom2.Plane|_function_|ivoa.ObsCore|em_resolution_min|
|--|caom2.Plane|_function_|ivoa.ObsCore|em_resolution_max|
|Energy.dimension|caom2.Plane|energy_dimension|ivoa.ObsCore|em_xel|
|||||||
|Time.bounds|caom2.Plane|time_bounds|ivoa.ObsCore||
|--|caom2.Plane|_function_|ivoa.ObsCore|t_min|
|--|caom2.Plane|_function_|ivoa.ObsCore|t_max|
|Time.exposure|caom2.Plane|time_exposure|ivoa.ObsCore|t_exptime|
|Time.exposureBounds|caom2.Plane|time_exposureBounds|ivoa.ObsCore||
|--|caom2.Plane|_function_|ivoa.ObsCore|t_exptime_min|
|--|caom2.Plane|_function_|ivoa.ObsCore|t_exptime_max|
|Time.resolution|caom2.Plane|time_resolution|ivoa.ObsCore|t_resolution|
|Time.dimension|caom2.Plane|time_dimension|ivoa.ObsCore|t_xel|
|||||||
|Polarization.states|caom2.Plane|polarization_states|ivoa.ObsCore|pol_states|
|Polarization.dimension|caom2.Plane|polarization_dimension|ivoa.ObsCore|pol_xel|
|Observable.ucd|caom2.Plane|observable_ucd|ivoa.ObsCore|o_ucd|

## publisherID
The `publisherID` field is not part of the model because it should/must be modified when metadata instances are
synchronised (mirrored) by a different data centre (publisher). Exclusion from the model means the `publisherID` is
included in the mataChecksum calculation. This field is part of a correct implementation since this value is required 
in ObsCore and (will be required) CAOM-TAP.

## function
Where the `vodml-uid` is `--` and the CAOM column is _function_, this is a continuation of the preceding line and
means that the ObsCore scalar value is extracted from the non-scalar CAOM value. For example, to map
`{s_region,s_ra,s_dec,s_fov}` from ObsCore to CAOM, one only needs to map the value of `s_region` to `position_bounds`;
all the other values are computed from the `position_bounds`.
