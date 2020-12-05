SELECT
"a".updated_at,
"a".status,
"a".accel_x,
"a".accel_y,
"a".accel_z,
"a".rot_x,
"a".rot_y,
"a".rot_z,
"a".pose_x,
"a".pose_y,
"a".pose_z,
b.throttle,
b.rpm,
b.speed,
b.eng_load,
b.eng_suhu,
b.bat_curr,
b.bat_suhu,
b.bat12_volt
FROM
sensorenv AS a ,
sensorpower AS b
WHERE a.id = b.id and a.status='FromMegamendung'
