// Copyright 2025 Nicolai Electronics
// SPDX-License-Identifier: CERN-OHL-P-2.0

// Tanmatsu speaker adapter

$fn=25;

module speaker_adapter() {
    speaker_width = 25;
    speaker_depth = 35;

    adapter_height = 4.2;

    wall_width_size = 2.33;
    wall_depth_size = 2.6;

    hole_width = speaker_width - wall_width_size*2;
    hole_depth = speaker_depth - wall_depth_size*2;
    
    wall_thickness = 1.5;

    difference() {
        union() {
            difference() {
                translate([-wall_thickness/2, -wall_thickness/2, 0]) cube([speaker_width + wall_thickness, speaker_depth + wall_thickness, adapter_height]);
                hull() {
                    translate([wall_width_size + hole_width / 2,wall_depth_size + hole_width / 2,-0.01]) cylinder(h=adapter_height + 0.02, r=hole_width/2);
                    translate([wall_width_size + hole_width / 2, speaker_depth - wall_depth_size - hole_width / 2,-0.01]) cylinder(h=adapter_height + 0.02, r=hole_width/2);
                }
            }
            translate([speaker_width + wall_thickness/2,5.5,0]) cube([10, speaker_depth-15.5, adapter_height]);
    }
        
        translate([speaker_width - wall_width_size - 3,5.5 + 1,0.6]) cube([10 - wall_thickness - wall_width_size + 9, speaker_depth - 15.5 - 2, adapter_height]);
    }
}

speaker_adapter();