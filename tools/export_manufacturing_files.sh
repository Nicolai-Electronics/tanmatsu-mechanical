#!/bin/bash
# Author: Jelle Haandrikman <jhaand@freedom.nl>
# Date 2025-08-02
#
# This script will convert the exported AMF and STEP files to the correct names for a release.
#
# TODO: Export the files directly from FreeCAD to the desired files.

mv Tanmatsu_3D-printed-case.amf ./release/case.amf
mv Tanmatsu_3D-printed-case.step ./release/case.step
mv Tanmatsu_3D-printed-field_test_case.amf ./release/case-for-mainboard-revision1-and-2.amf
mv Tanmatsu_3D-printed-field_test_case.step ./release/case-for-mainboard-revision1-and-2.step
mv Tanmatsu_3D-printed-field_test_spacer.amf ./release/spacer-for-mainboard-revision1-and-2.amf
mv Tanmatsu_3D-printed-field_test_spacer.step ./release/spacer-for-mainboard-revision1-and-2.step
mv Tanmatsu_3D-printed-spacer.amf ./release/spacer.amf
mv Tanmatsu_3D-printed-spacer.step ./release/spacer.step
mv Tanmatsu_3D-printed-speaker_adapter.amf ./release/speaker_adapter.amf
mv Tanmatsu_3D-printed-speaker_adapter.step ./release/speaker_adapter.step

