param (
    [Parameter(Mandatory=$false)]
    [string]$Path
)

# Función para eliminar directorios vacíos
function Remove-EmptyDirectories($path) {
    $deletedDirs = @()
    $maxDepth = 100 # Ajusta este valor según tus necesidades

    $stack = New-Object System.Collections.Stack
    $stack.Push((Get-Item $path))

    while ($stack.Count -gt 0) {
        $currentDir = $stack.Pop()
        $childDirs = @(Get-ChildItem -Path $currentDir.FullName -Force -Directory)

        foreach ($dir in $childDirs) {
            if ($dir.FullName.Split('\').Count -gt $maxDepth) {
                Write-Warning "Se omitió el directorio $($dir.FullName) debido a la profundidad máxima alcanzada."
            } else {
                $isEmpty = $true
                $allItems = Get-ChildItem -Path $dir.FullName -Force -Recurse
                foreach ($item in $allItems) {
                    if (!$item.PSIsContainer) {
                        $isEmpty = $false
                        break
                    }
                }
                if ($isEmpty) {
                    Remove-Item -Force -Recurse $dir.FullName
                    $deletedDirs += $dir.FullName
                } else {
                    $stack.Push($dir)
                }
            }
        }
    }

    return $deletedDirs
}

# Verificar si se proporcionó la ruta
if (-not $Path) {
    Write-Host "No se proporcionó una ruta de directorio."
    Write-Host "Uso: .\elim_dir_vacios.ps1 -Path <ruta_del_directorio>"
    return
}

# Llamar a la función para eliminar directorios vacíos
$deletedDirectories = Remove-EmptyDirectories -path $Path

# Mostrar el número de directorios eliminados
$deletedCount = $deletedDirectories.Count
Write-Host "Se eliminaron $deletedCount directorios vacíos en $Path."