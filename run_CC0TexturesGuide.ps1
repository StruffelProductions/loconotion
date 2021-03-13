cd $PSScriptRoot
pip install -r .\requirements.txt
$WebFolder="\\struffel.synology.me\CC0 Textures\Notion\CC0TexturesGuide\"
$Toml = "CC0TexturesGuide.toml"

if ($WebFolder | Test-Path) {
    Write-Host  "$WebFolder present!" -ForegroundColor Green
}else{
    Write-Host -ForegroundColor Red "$WebFolder not present!"
    exit
}

Remove-Item ".\dist\CC0TexturesGuide\*"
python loconotion $Toml
if($?){
    if ($WebFolder | Test-Path) {
        Write-Host  "$WebFolder present!" -ForegroundColor Green
    }else{
        Write-Host -ForegroundColor Red "$WebFolder not present!"
        exit
    }
    Copy-item -Force -Recurse -Verbose ".\dist\CC0TexturesGuide\*" -Destination $WebFolder
}