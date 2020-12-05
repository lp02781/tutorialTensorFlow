SELECT
"public".sensorpower.updated_at,
"public".sensorpower.status,
"public".sensorenv.accel_x,
"public".sensorenv.accel_y,
"public".sensorenv.accel_z,
"public".sensorenv.rot_x,
"public".sensorenv.rot_y,
"public".sensorenv.rot_z,
"public".sensorenv.pose_x,
"public".sensorenv.pose_y,
"public".sensorenv.pose_z,
"public".sensorpower.throttle,
"public".sensorpower.rpm,
"public".sensorpower.speed,
"public".sensorpower.eng_load,
"public".sensormotion.latitude,
"public".sensormotion.longitude,
"public".sensormotion.altitude,
"public".sensormotion.heading,
"public".sensormotion.speed_gps,
"public".sensorenv.suhu,
"public".sensorenv.humid
FROM
"public".sensorpower
INNER JOIN "public".sensorenv ON "public".sensorpower.updated_at = "public".sensorenv.updated_at
INNER JOIN "public".sensormotion ON "public".sensorpower.updated_at = sensormotion.updated_at
WHERE
"public".sensorenv.status = 'ToMegamendung'
