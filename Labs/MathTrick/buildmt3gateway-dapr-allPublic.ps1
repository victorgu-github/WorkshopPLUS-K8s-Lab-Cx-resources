Param(
    $acrname = "scubakiz",    
    $imageprefix = "mt3gd"
)
$imagename = "$($imageprefix)-gateway"
docker build -t "$($acrname)/$($imagename):latest" --file ./Gateway/MT3Gateway-Gateway/Dockerfile .
docker push "$($acrname)/$($imagename):latest"
$imagename = "$($imageprefix)-web"
docker build -t "$($acrname)/$($imagename):latest" --file ./Gateway/MT3Gateway-Web/Dockerfile ./Gateway/MT3Gateway-Web/.
docker push "$($acrname)/$($imagename):latest"
for (($i = 1); $i -lt 6; $i++) {
    $step = $i
    $imagename = "mt3gd-step$($step)"
    docker build -t "$($acrname)/$($imagename):latest" --file "./Gateway/MT3Gateway-Step$($step)/Dockerfile" .
    docker push "$($acrname)/$($imagename):latest"
}
$imagename = "mt3gd-step2-nodejs"
$folder = "./Gateway-Dapr/MT3GD-Step2-NodeJS/"
Set-Location $folder
docker build -t "$($acrname)/$($imagename):latest" --file "Dockerfile" .
docker push "$($acrname)/$($imagename):latest"
Set-Location ../..