@echo off
setlocal
set "proj_dir=D:\PoeAssetsExporter"
set "output=%proj_dir%\output"
set "output_tmp=%proj_dir%\output_tmp"
set "PoeAssetUpdater_path=%proj_dir%\PoeAssetUpdater"
set "LibBundle_path=%proj_dir%\LibBundle"
set "poe_bundle_path=D:\Steam\steamapps\common\Path of Exile\Bundles2"

pushd "%proj_dir%"

mkdir "%output%"
copy /B "%poe_bundle_path%\_.index.bin" "%output%\_.index.bin" >nul
robocopy "%poe_bundle_path%\art\2DItems" "%output%\art\2DItems" /E

copy /B "%LibBundle_path%\oo2core_8_win64.dll" "%output%\oo2core_8_win64.dll" >nul
copy /B "%LibBundle_path%\LibBundle.dll" "%output%\LibBundle.dll" >nul

pushd "%output%"
@echo | "%LibBundle_path%\BundleExporter.exe"

for /f "tokens=* delims=" %%f in ('dir "." /a:d /s /b') do (
  magick mogrify -format png %%f\*.dds
)
popd

for /f "tokens=* delims=" %%f in ('dir "%output%" /a:-d /s /b') do  IF /i NOT "%%~xf"==".png" DEL "%%f"
FOR /d %%a IN ("%output%\*") DO RD /Q "%%a"

mkdir "%output_tmp%"
mkdir "%PoeAssetUpdater_path%\cache"

@echo | "%PoeAssetUpdater_path%\PoEAssetUpdater\PoEAssetUpdater.exe" "%poe_bundle_path%" "%output_tmp%" "%PoeAssetUpdater_path%\cache" "%PoeAssetUpdater_path%\resources\stable.py"

copy "%output_tmp%\base-item-types-v2.json" "%output%\base_items_lookup.json" >nul
copy "%output_tmp%\unique-artname-mapping.json" "%output%\unique_items_lookup.json" >nul

rd /Q "%output_tmp%" 

popd
