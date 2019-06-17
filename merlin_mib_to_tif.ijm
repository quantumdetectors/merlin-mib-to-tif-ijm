path_to_mib = getDirectory("Choose path");
path_to_tiff = path_to_mib+"tiff_files"+File.separator;
list = getFileList(path_to_mib);
Dialog.create("Merlin .mib to .tif converter");
Dialog.addString("Path to .mib files:", path_to_mib,70);
Dialog.addString("Path to .tif files:", path_to_tiff,70);
bit_depths = newArray("1-bit","6-bit","12-bit","24-bit");
Dialog.addChoice("Bits:", bit_depths,bit_depths[2]);
Dialog.addCheckbox("Raw mode", false);
Dialog.addMessage("Tool for converting .mib files to .tif files.");
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
Dialog.addMessage("Copyright Quantum Detectors " + year);
Dialog.show()
path_to_mib = Dialog.getString();
path_to_tiff = Dialog.getString();
bit_mode = Dialog.getChoice();
raw = Dialog.getCheckbox();
if (!raw){
	if (bit_mode == "1-bit") bit_mode = "8-bit";
	if (bit_mode == "6-bit") bit_mode = "8-bit";
	if (bit_mode == "12-bit") bit_mode = "16-bit";
	if (bit_mode == "24-bit") bit_mode = "32-bit";
}
if (!File.exists(path_to_tiff)){
    File.makeDirectory(path_to_tiff);
}

setBatchMode(true);
l = list.length;
for(i=0;i<l;i++){
    if (endsWith(list[i],".mib")){
        path_tmp = path_to_mib+list[i];
        run("Raw...", "open=["+path_tmp+"] image=["+bit_mode+" Unsigned] width=256 height=256 offset=384 number=1 gap=384");
        tiff_name = path_to_tiff+replace(list[i],".mib",".tif");
        saveAs("Tiff", tiff_name);
    }
}
run("Close All");
