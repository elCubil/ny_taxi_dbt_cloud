WITH yellow_trips AS(
    SELECT
        'yellow' AS service_type,
        vendor_id,
        pickup_datetime,
        dropoff_datetime,
        passenger_count,
        trip_distance,
        rate_code_id,
        store_and_fwd_flag,
        pickup_location_id,
        dropoff_location_id,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        congestion_surcharge,
        cast(null as int64) as trip_type,
        cast(null as string) as ehail_fee
    FROM {{ref('stg_ny_taxi__yellow_trips')}}

),

green_trips AS(

    SELECT
        'green' AS service_type,
        vendor_id,
        pickup_datetime,
        dropoff_datetime,
        passenger_count,
        trip_distance,
        rate_code_id,
        store_and_fwd_flag,
        pickup_location_id,
        dropoff_location_id,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        congestion_surcharge,
        trip_type,
        ehail_fee
    FROM {{ref('stg_ny_taxi__green_trips')}}
),

tablas_unidas AS(
    SELECT * FROM yellow_trips
    UNION ALL
    SELECT * FROM green_trips
)

SELECT *
FROM tablas_unidas