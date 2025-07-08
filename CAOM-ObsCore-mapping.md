# CAOM - ObsCore Mapping

This is the standard mapping between CAOM-2.5 and ObsCore-1.2 - both at working draft (WD) stage.

Informative: the standard CAOM table and column names are included below; these will be specified
in a separate standard (CAOM-TAP). The standard rules to generate the relational mapping:
* {model rpefix} -> {schema name}
* {entity class name} -> {table name}
* {vodml-id} -> (dots converted to underscore) -> {column_name} (vodml-id rules TBD)

|CAOM vodml-id|CAOM entity|CAOM table|CAOM column|ObsCore table/view|ObsCore column|
|-------------|-----------|----------|-----------|------------------|--------------|
|Observation.uri|Observation|caom2.Observation|uri|ivoa.ObsCore|obs_id|
|Observation.collection|Observation|caom2.Observation|collection|ivoa.ObsCore|obs_collection|
|Telescope.name|Observation|caom2.Observation|telescope_name|ivoa.ObsCore|facility_name|
|Instrument.name|Observation|caom2.Observation|instrument_name|ivoa.ObsCore|instrument_name|
|Target.name|Observation|caom2.Observation|target_name|ivoa.ObsCore|target_name|
|Plane.uri|Plane|caom2.Plane|uri|ivoa.ObsCore|obs_creator_did|
||Plane|caom2.Plane|publisherID|ivoa.ObsCore|obs_publisher_did|
|Plane.dataRelease|Plane|caom2.Plane|dataRelease|ivoa.ObsCore|obs_release_date|
|Plane.dataProductType|Plane|caom2.Plane|dataProductType|ivoa.ObsCore|dataproduct_type|
|Plane.calibrationLevel|Plane|caom2.Plane|calibrationLevel|ivoa.ObsCore|calib_level|
|||||||
|||||ivoa.ObsCore|access_url|
|||||ivoa.ObsCore|access_format|
|||||ivoa.ObsCore|access_estsize|
|Position.bounds|Plane|caom2.Plane|position_bounds|ivoa.ObsCore|s_region|
|Position.bounds|Plane|caom2.Plane|_function_|ivoa.ObsCore|s_ra|
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|s_dec|
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|s_fov|
|Position.resolution|Plane|caom2.Plane|position_resolution|ivoa.ObsCore|s_resolution|
|Position.resolutionBounds|Plane|caom2.Plane|position_resolutionBounds|ivoa.ObsCore||
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|s_resolution_min|
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|s_resolution_max|
|Position.dimension|Plane|caom2.Plane|position_dimension|ivoa.ObsCore||
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|s_xel1|
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|s_xel2|
|||||||
|Energy.bounds|Plane|caom2.Plane|energy_bounds|ivoa.ObsCore||
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|em_min|
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|em_max|
|Energy.resolvingPower|Plane|caom2.Plane|energy_resolvingPower|ivoa.ObsCore|em_res_power|
|Energy.resolution|Plane|caom2.Plane||ivoa.ObsCore|em_resolution|
|Energy.resolutionBounds|Plane|caom2.Plane|energy_resolutionBounds|ivoa.ObsCore||
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|em_resolution_min|
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|em_resolution_max|
|Energy.dimension|Plane|caom2.Plane|energy_dimension|ivoa.ObsCore|em_xel|
|(not in model)|Plane|caom2.Plane||ivoa.ObsCore|em_ucd|
|||||||
|Time.bounds|Plane|caom2.Plane|time_bounds|ivoa.ObsCore||
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|t_min|
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|t_max|
|Time.exposure|Plane|caom2.Plane|time_exposure|ivoa.ObsCore|t_exptime|
|Time.exposureBounds|Plane|caom2.Plane|time_exposureBounds|ivoa.ObsCore||
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|t_exptime_min|
|--|Plane|caom2.Plane|_function_|ivoa.ObsCore|t_exptime_max|
|Time.resolution|Plane|caom2.Plane|time_resolution|ivoa.ObsCore|t_resolution|
|Time.dimension|Plane|caom2.Plane|time_dimension|ivoa.ObsCore|t_xel|
|||||||
|Polarization.states|Plane|caom2.Plane|polarization_states|ivoa.ObsCore|pol_states|
|Polarization.dimension|Plane|caom2.Plane|polarization_dimension|ivoa.ObsCore|pol_xel|
|Observable.ucd|Plane|caom2.Plane|observable_ucd|ivoa.ObsCore|o_ucd|


