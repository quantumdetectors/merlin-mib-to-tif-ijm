// Quantum Detectors
// Authored June 2019
// ImageJ/Fiji macro for batch converting Merlin .mib to .tif

// When macro is run, prompt user to select directory with .mib files
path_to_mib = getDirectory("Choose path");
path_to_tiff = path_to_mib+"tiff_files"+File.separator;

// Get list of files in .mib directory
list = getFileList(path_to_mib);

// Create GUI
Dialog.create("Merlin .mib to .tif converter");
Dialog.addString("Path to .mib files:", path_to_mib,70);
Dialog.addString("Path to .tif files:", path_to_tiff,70);
bit_depths = newArray("1-bit","6-bit","12-bit","24-bit");
Dialog.addChoice("Bits:", bit_depths,bit_depths[2]);
Dialog.addMessage("Tool for converting .mib files to .tif files.");
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
Dialog.addMessage("Quantum Detectors, Copyright " + year);
Dialog.show()

// Allow changing paths by hand. Note changing path_to_mib might produce an error if path does not exist.
path_to_mib = Dialog.getString();
path_to_tiff = Dialog.getString();

// Create directory for .tif files if it does not exist.
if (!File.exists(path_to_tiff)){
    File.makeDirectory(path_to_tiff);
}

// Get bit and raw mode
bit_mode = Dialog.getChoice();

// Add padding for correct conversions if not raw
if (bit_mode == "1-bit") bit_mode = "8-bit";
if (bit_mode == "6-bit") bit_mode = "8-bit";
if (bit_mode == "12-bit") bit_mode = "16-bit";
if (bit_mode == "24-bit") bit_mode = "32-bit";

setBatchMode(true);

// Convert all .mib files in path_to_mib to .tif files and save them in path_to_tiff.
l = list.length;
for(i=0;i<l;i++){
    if (endsWith(list[i],".mib")){
        path_tmp = path_to_mib+list[i];
        run("Raw...", "open=["+path_tmp+"] image=["+bit_mode+" Unsigned] width=256 height=256 offset=384 number=1 gap=384");
        tiff_name = path_to_tiff+replace(list[i],".mib",".tif");
        saveAs("Tiff", tiff_name);
    }
}

// Close logs.
run("Close All");
