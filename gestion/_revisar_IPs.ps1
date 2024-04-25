# Ruta completa del primer script
$script1 = "D:\Users\earmijo\Documents\soporte\inet\IPs\identificar_IPs_libres_rango1_INALAMBRICA.ps1"
# Ruta completa del segundo script
$script2 = "D:\Users\earmijo\Documents\soporte\inet\IPs\identificar_IPs_libres_rango2_SECUNDARIA.ps1"
# Ruta completa del tercer script
$script3 = "D:\Users\earmijo\Documents\soporte\inet\IPs\identificar_IPs_libres_rango3_CABLEADA.ps1"

# Ejecutar los scripts
Invoke-Expression $script1
Invoke-Expression $script2
Invoke-Expression $script3