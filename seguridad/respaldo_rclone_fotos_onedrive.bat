REM Configura el acceso a OneDrive, asignando manualmente el nombre "odrive"
rclone config

REM Listar contenido de unidad remota
rclone lsd odrive:

REM Sincronizar una carpeta local con una carpeta remota en unidad remota "odrive"

REM Respaldo completo de fotos en "odrive"
timecmd rclone sync "Z:\multimedios\f" "odrive:\tiempo libre\f"

REM Respaldo completo de música en "odrive"
rclone sync "Y:\multimedios\mus" "odrive:\tiempo libre\mus"

REM Respaldo completo carpeta en "box"
rclone sync "odrive:\tiempo libre\humor" "box:\tiempo libre\humor"

REM Movido de carpeta a "box"
rclone move "odrive:\tiempo libre\fotog" "box:\tiempo libre\fotog"

REM Movido de carpeta a "box" (con registro del tiempo tomado)
timecmd rclone move "odrive:\tiempo libre\lecturas" "box:\tiempo libre\lecturas"

REM Movido de carpeta a "box"
timecmd rclone move "odrive:\tiempo libre\turismo" "box:\tiempo libre\turismo"

