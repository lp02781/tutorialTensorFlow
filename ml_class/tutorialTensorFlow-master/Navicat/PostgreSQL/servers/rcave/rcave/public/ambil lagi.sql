SELECT
"public".sensormotion.updated_at,
"public".sensormotion.latitude,
"public".sensormotion.longitude,
"public".sensormotion.altitude,
"public".sensormotion.speed_gps
FROM
"public".sensormotion
WHERE
"public".sensormotion.status = 'FromMegamendung' AND
"public".sensormotion.latitude IS NOT NULL AND
"public".sensormotion.longitude IS NOT NULL AND
"public".sensormotion.altitude IS NOT NULL AND
"public".sensormotion.speed_gps IS NOT NULL
ORDER BY
"public".sensormotion.updated_at ASC
