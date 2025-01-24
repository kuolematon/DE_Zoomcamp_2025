Homework 1: Docker, SQL and Terraform

Question 1.

Solution:
root@de:~# docker run -it python:3.12.8 /bin/bash

docker run -it python:3.12.8 /bin/bash
root@f14e424c6c08:/# pip -V
pip 24.3.1 from /usr/local/lib/python3.12/site-packages/pip (python 3.12)

Answer: 24.3.1


Question 2. 

Answer: postgres:5433


Question 3. Trip Segmentation Count

Solution:
SELECT 
    COUNT(CASE 
            WHEN trip_distance <= 1 THEN 1
          END) AS "Up to 1 mile",
    COUNT(CASE 
            WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1
          END) AS "Between 1 and 3 miles",
    COUNT(CASE 
            WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1
          END) AS "Between 3 and 7 miles",
    COUNT(CASE 
            WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1
          END) AS "Between 7 and 10 miles",
    COUNT(CASE 
            WHEN trip_distance > 10 THEN 1
          END) AS "Over 10 miles"
FROM 
    green_tripdata
WHERE 
    DATE(lpep_dropoff_datetime) >= '2019-10-01' AND DATE(lpep_dropoff_datetime) < '2019-11-01';

Answer: 104,802; 198,924; 109,603; 27,678; 35,189


Question 4. Longest trip for each day

Solution:
SELECT DATE(lpep_pickup_datetime) as pickup_date,
	max(trip_distance)
FROM green_tripdata
GROUP BY 1
ORDER by 2 DESC;

Answer: 2019-10-31


Question 5. Three biggest pickup zones

Solution:
SELECT SUM(gt.total_amount) as total_amount,
	tzl_pickup."Zone" pickup_zone
FROM green_tripdata gt
LEFT JOIN taxi_zone_lookup tzl_pickup
	ON tzl_pickup."LocationID" = gt.pulocationid
WHERE DATE(gt.lpep_pickup_datetime) = '2019-10-18'
GROUP BY 2
HAVING SUM(gt.total_amount) > 13000
ORDER by 1 desc;

Answer: East Harlem North, East Harlem South, Morningside Heights


Question 6. Largest tip

Solution:
SELECT tzl_drop."Zone" dropoff_zone,
	tzl_pickup."Zone" pickup_zone,
	gt.tip_amount
FROM green_tripdata gt
LEFT JOIN taxi_zone_lookup tzl_drop
	ON tzl_drop."LocationID" = gt.dolocationid
LEFT JOIN taxi_zone_lookup tzl_pickup
	ON tzl_pickup."LocationID" = gt.pulocationid
WHERE tzl_pickup."Zone" = 'East Harlem North'
	AND date_part('month', lpep_pickup_datetime) = 10
ORDER BY 3 DESC;

Answer: JFK Airport


Question 7. Terraform Workflow
