# Tanmatsu mechanical design files

This repository contains the design files for the 3D printed mechanical parts for the Tanmatsu.

These consist of the following: 
  * Case
  * Spacer 
  * Speaker adapter 

All parts are integrated in the FreeCAD design file. Also a separate
STEP file each part, so people can print these directly from this
repository.

In order to add the bolts to the design, install the 'Fasteners' workbench 
via the add-on manager. 

# Which revision do I need?

You can find out your mainboard revision by going to `Settings > Device
information` in the launcher firmware.

If you have board revision 1 or 2 you need the "for revision 2" files. If you
have a newer board revision you need the "for revision 3" files.

The breaking change in case design is due to us having to move the audio jack
down by two millimeters and outwards by two millimeters to solve a
manufacturing problem.

# Getting Tanmatsu STEP files.

Clone the repositories for both the Tanmatsu mainboard and a frontpanel. 

 * Open the design wiht KiCAD.
 * Open the PCB editor.
 * Select Export -> "STEP / GLB/, etc."
 * Select STEP as format. 
 * Use the default settings
 * Press Export. 
 * Now import the STEP files in the FreeCAD file. Make sure to disable the
   'Linkgroup' setting while importing. Otherwise deleting the PCB will become
   very tiresome. 
 * Place them in the correct location by selecting the corresponding PCB and:
    * Tanmatsu PCB: set Data -> Placement -> Position -> z = -1.55 mm
    * Frontpanel PCB: set Data -> Placement -> Position -> z = 2.40 mm

# Generating output files

Generating the output files from FreeCAD happens via a bash script command line
form. With FreeCAD close and from the repository root directory execute
`./tools/export_manufacturing_files.sh`. The resulting STEP and AMF files will 
appear in the `./release/` directory with the correct names. 

The 'tools' directory has a simple FreeCAD file available for testing purposes.
Exporting everything while debugging Python scripts get boring real fast.

Note: The script does produce some errors from the Fasteners Workbench. 
See this issue: https://github.com/shaise/FreeCAD_FastenersWB/issues/454

# License

Copyright 2024-2025 Nicolai Electronics

Copyright 2024-2025 Ytec Engineering

Copyright 2025 Jelle Haandrikman

This work is licensed under the CERN-OHL-P license. Full license text is
included in the [LICENSE](LICENSE) file.
