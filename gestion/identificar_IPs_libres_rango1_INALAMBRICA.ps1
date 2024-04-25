$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding


# IPs conexión INALÁMBRICA

$OutputEncoding = [System.Text.Encoding]::UTF8

# Rango de direcciones IP
$inicio = 05
$fin = 50

# Dirección IP de base (cambia esto a tu dirección de red local)
$ipBase = "10.80.192."

# El archivo donde guardarás las direcciones IP no asignadas
$rutaArchivo = "D:\Users\earmijo\Documents\soporte\inet\IPs\IPsNoAsignadas_rango1.txt"

# Si el archivo ya existe, borra el contenido
if (Test-Path $rutaArchivo) {
    Clear-Content $rutaArchivo
}

# Recorremos todas las posibles direcciones IP en el rango
for ($i=$inicio; $i -le $fin; $i++) {
    $ip = $ipBase + $i
    # Hacemos un ping a la dirección IP
    $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet -ErrorAction SilentlyContinue
    # Si el ping es exitoso, la dirección IP está en uso
    if ($ping) {
        Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::UTF8.GetBytes("$ip está en uso")))
    } else {
        Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::UTF8.GetBytes("$ip no está en uso")))
        # Si no está en uso, escribe la dirección IP en el archivo
        Add-Content -Path $rutaArchivo -Value $ip
    }
}
