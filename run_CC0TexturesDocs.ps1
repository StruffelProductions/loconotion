cd $PSScriptRoot
pip install -r .\requirements.txt
$WebFolder="\\struffel.synology.me\CC0 Textures\Notion\CC0TexturesDocs\"
$Toml = "CC0TexturesDocs.toml"

if ($WebFolder | Test-Path) {
    Write-Host  "$WebFolder present!" -ForegroundColor Green
}else{
    Write-Host -ForegroundColor Red "$WebFolder not present!"
    exit
}

Remove-Item ".\dist\CC0TexturesDocs\*"
python loconotion $Toml
if($?){
    if ($WebFolder | Test-Path) {
        Write-Host  "$WebFolder present!" -ForegroundColor Green
    }else{
        Write-Host -ForegroundColor Red "$WebFolder not present!"
        exit
    }
    Copy-item -Force -Recurse -Verbose ".\dist\CC0TexturesDocs\*" -Destination $WebFolder
}