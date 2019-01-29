This dataset contains JSONs sent as the body of the HTTP POST request by the back-end to the proof-of-concept R UDF service for openEO. These dataset could be used to reproduce the results using Strategies 2A, 2B and 3 as used in the openEO.R.UDF package on Github (https://github.com/pramitghosh/openEO.R.UDF).

The JSONs represent 3 time-steps of spatially subsetted (300x300px) Sentinel-2 images containing 13 bands each. The JSON also contain additional information regarding the UDF function definition as well as other important supplementary data such as timestamps, band names etc.

There are 3 groups of data in this dataset corresponding to the 3 strategies (2A, 2B and 3):

* udf_raw_*.json: These files are for strategy 2B and are to be POSTed to the endpoint /udf/raw
* udf_binary_*.json: These files are for strategy 3 and are to be POSTed to the endpoint /udf/binary
* udf_*.json (all other files except those mentioned above): These files are for strategy 2A and are to be POSTed to the endpoint /udf
