# PoeAssetsExporter

A simple script that streamlines exporting 2d item assets from PoE Bundle (coming with the Steam version). It produces:
 * A json file containing itemId to name and asset mappings.
 * A directory tree with 2d item images in png format.

## Requirements
 * https://github.com/WhiteFang5/PoE-Asset-Updater - a tool used to extract data about item ids, names and assets assigned to them (needs to be compiled).
 * https://github.com/aianlinb/LibBundle - a tool used to export files bundles in a Bundle (basicly unzipping).
 * https://imagemagick.org/ - used to convert .dds images to .png format.

## Usage
1. Download required tools.
2. Install ImageMagick.
3. Compile PoeAssetUpdater (in the future there might be a compiled version).
4. Edit Run.bat file. Set variable to point to appropriate folders.
5. Run the script.
6. Output is put in a folder pointed to by `output` variable.

#### Warning! The script performs a cleanup afterwards. Make sure variables point to folders that doesn't contain anything else! Folders pointed to by `output` and `output_tmp` variables get cleaned.
