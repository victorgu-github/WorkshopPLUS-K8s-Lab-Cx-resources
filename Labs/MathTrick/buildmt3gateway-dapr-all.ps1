Param(
    $acrname = "kizacr",    
    $imageprefix = "mt3gatewaydapr"
)
#$acrname = $acrname + ".azurecr.io";
$imagename = "$($imageprefix)-gateway"
docker build -t "$($acrname)/$($imagename):latest" --file ./GatewayDapr/MT3GatewayDapr-Gateway/Dockerfile .
docker push "$($acrname)/$($imagename):latest"
$imagename = "$($imageprefix)-web"
docker build -t "$($acrname)/$($imagename):latest" --file ./GatewayDapr/MT3GatewayDapr-Web/Dockerfile ./GatewayDapr/MT3GatewayDapr-Web/.
docker push "$($acrname)/$($imagename):latest"
for (($i = 1); $i -lt 6; $i++) {
    $step = $i
    $imagename = "mt3gatewaydapr-step$($step)"
    docker build -t "$($acrname)/$($imagename):latest" --file "./GatewayDapr/MT3GatewayDapr-Step$($step)/Dockerfile" .
    docker push "$($acrname)/$($imagename):latest"
}
$imagename = "mt3gatewaydapr-step2-nodejs"
$folder = "./GatewayDapr/MT3GatewayDapr-Step2-NodeJS/"
Set-Location $folder
docker build -t "$($acrname)/$($imagename):latest" --file "Dockerfile" .
docker push "$($acrname)/$($imagename):latest"
Set-Location ../..