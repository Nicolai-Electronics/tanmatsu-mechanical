#!/bin/bash
# Author: Jelle Haandrikman <jhaand@freedom.nl>
# Date 2025-08-02
#
# This script will convert the exported AMF and STEP files to the correct names for a release.
#
# TODO: Export the AMF files directly from FreeCAD to the desired files.

if flatpak search info org.freecad.FreeCAD &> /dev/null ; then 
    flatpak run org.freecad.FreeCAD --console tools/freecad_export.py
else
    echo "FreeCAD is not installed as Flatpak."
    exit 0
fi

mv ./release/field_test_case.amf ./release/case-for-mainboard-revision1-and-2.amf
mv ./release/field_test_case.step ./release/case-for-mainboard-revision1-and-2.step
mv ./release/field_test_spacer.amf ./release/spacer-for-mainboard-revision1-and-2.amf
mv ./release/field_test_spacer.step ./release/spacer-for-mainboard-revision1-and-2.step

