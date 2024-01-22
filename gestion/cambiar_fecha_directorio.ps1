# Cambia sólo la fecha de todos los archivos de un cierto tipo en un directorio.
# La hora original se mantiene.
Get-ChildItem -Path "D:/f/2023-07-09 w/altaRes/raw/*.CR2" -Recurse | ForEach-Object {
    $file = $_
    $newDate = Get-Date -Year 2023 -Month 7 -Day 9 -Hour $file.LastWriteTime.Hour -Minute $file.LastWriteTime.Minute -Second $file.LastWriteTime.Second
    Set-ItemProperty -Path $file.FullName -Name LastWriteTime -Value $newDate
}
