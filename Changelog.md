# CAOM changes
The following is a brief summary of changes in the current draft version (2.5).

## general changes 
- change `Plane.position.bounds` to be mandatory
- change `Plane.energy.bounds` to be mandatory
- change `Plane.time.bounds` to be mandatory
- change `Plane.polarization.states` to require at least 1 value

The above changes mean that each of position/energy/time/polarization objects have one mandatory field and 
queries with something like `Plane.position.bounds is not null` can be used to detect if the object is present.

- add `ArtifactDescription` entity to support providing descriptions with links (eg in a DataLink output)
- add `Artifact.descriptionID` to refer to a shared `ArtifactDescription`
- add `Proposal.reference` as optional proposal metadata (URI to web page, paper, etc)

- split `Entity` into a base `Entity` class with main properties and a `CaomEntity` suitable for having 
child entities (by composition); one or both could be extracted and re-used in other models (TBD)

## radio support
For radio observations, many properties such as field-of-view, spatial and spectral resolution are dependent on frequency. Modern, wideband facilities can have large frequency-dependent variation in these properties within a single observation.

- add `Plane.position.minBounds` (Shape) to describe variable coverage (bounds is already max bounds)
- add `Plane.position.maxAngularScale` (Interval) to describe min/max scale of signal/objects in the data; could be in Plane.metrics?
- add `Plane.energy.resolution` (double) to describe the absolute resolution (representative value, probably mean/pixel)
- add `Plane.energy.resolutionBounds` (Interval) to describe the min/max absolute resolution when it varies across the data
- add `Plane.time.exposureBounds` (Interval) to describe the min/max absolute exposure time when it varies across the data
- change `Plane.energy.restwav` to `Plane.energy.rest` so the name makes sense with different profiles (quantities and units)
- remove `Plane.position.timeDependent` as it was only used to explain why Plane.position.bounds was null because of tracking mode

- add `Observation.telescope.trackingMode` and refer to a non-existent IVOA vocabulary to describe the 
  tracking/pointing of the telescope during the observation; null indicates sidereal tracking (for backwards compat)

- add `Plane.uv` (Visibility) to describe UV-plane (expect: only used when dataProductType=visibility)
- add `Plane.uv.distance` (Interval) to describe the min and max distance in the UV plane
- add `Plane.uv.distributionEccentricity` (double); mandatory or optional within Visibility?
- add `Plane.uv.distributionFill` (double); mandatory or optional within Visibility?

- change `Plane.polarization.states` to refer to a (non-existent) vocabulary (replaces PolarizationState enum) that could be extracted from WCS, ObsCore, and community usage/extensions

## identifiers
- replace `Observation.observationID` (String) with `Observation.uri` (URI) to be the complete self contained identifier; values would be used in `DerivedObservation.members` to refer to other observations
  
- replace `Plane.productID` (String) with `Plane.uri` (URI) to be the complete self-contained identifier; values would be used in `Plane.provenance.inputs` to refer to other planes
- remove `Plane.creatorID` because it is essentially redundant vs Plane.uri

A `publisherID` value is strictly outside the core model because the value must be changed (generated) when CAOM metadata is synced from one _publisher_ to _a differnt publisher_. 

## reconcile with IVOA data models

- change `Plane.dataProductType` to refer directly to the IVOA product-type vocabulary
- change `Artifact.productType` to refer directly to the IVOA DataLink Core (semantics) vocabulary
- change `Plane.observable.ucd` to refer directly to IVOA UCD1+

- add `Plane.position.calibration` and refer to a non-existent IVOA vocabulary that could be extracted from the ObsCore optional section
- add `Plane.energy.calibration` (as above)
- add `Plane.time.calibration` (as above)
- add `Plane.observable.calibration` (as above)

- remove SampledInterval in favour of separate Interval and Interval[] columns in Energy, Time, CustomAxis
- remove MultiPolygon in favour of separate Polygon and MultiShape columns; SegmentType and Vertex removed (unused)
