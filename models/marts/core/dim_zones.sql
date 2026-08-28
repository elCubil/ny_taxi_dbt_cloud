WITH zones AS (

    SELECT * 
    FROM {{ ref('taxi_zone_lookup') }}

),

renamed AS (

    SELECT
        LocationID as location_id,
        Borough as borough,
        Zone as zone,
        service_zone

    FROM zones

)

SELECT * 
FROM renamed