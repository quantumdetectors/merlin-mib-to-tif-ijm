# Convert .mib to .tif using ImageJ

A macro for use with ImageJ/Fiji to convert Merlin to copy all .mib files in a given directory
into a subdirectory /PathTo_mib_files/tiff_files and convert them to .tif files.

## Setup procedure

The macro is good to use without the need of any configuration on both Windows and Unix systems.

## Desktop icon on Windows

To create an executable right click on the desktop and select `New > Text Document`.
Insert the following text and edit it accordingly:

```bash
C:/PathToImageJ/imagej-win64.exe --ij2 --run C:/PathToScript/merlin_mib_to_tif.ijm
```

rename the file to e.g. `Merlin mib To tif Converter.bat` and follow [this Stackoverflow post](https://superuser.com/questions/868340/how-can-i-convert-a-windows-batch-script-to-a-exe) to make it executable, if it isn't
straight off the `.bat`.

# License
[MIT license](./LICENSE)
