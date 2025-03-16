// Copyright 2025 Nicolai Electronics
// SPDX-License-Identifier: CERN-OHL-P-2.0

// Tanmatsu case modifications

base_height = 0;
wall_thickness = 1.5;
wall_height = 0.5;

battery_width = 40;
battery_depth = 53.5;
battery_height = 10.2;

cable_hole_width = 2;
cable_hole_offset = 3;

hook_height = wall_height;

sma = true; // option, no hole for internal antenna
show_speaker_adapter = false; // 3D printed separately

battery_holder_pos = [120-46 - battery_depth,51.8,1.65-0.2];
speaker_pos = [120-42,10,1.65];

speaker_adapter_pos = speaker_pos + [0,0,6.3];

// Tanmatsu case made in Solidworks
difference() {
    color([1,0,0,0.5]) import("case_base.stl", convexity=3);
    
    // Remove a little bit of the back to create enough space for the battery cell
    translate(battery_holder_pos) rotate([0,0,270]) cube([battery_width + wall_thickness*2, battery_depth + wall_thickness*2, battery_height + wall_height], false);
    
    // Add 6mm hole for SMA antenna connector
    if (sma) {
        translate([84,125,6]) rotate([270,0,0]) cylinder(h=10, r=3.3, $fn=40);
    }
}

// This is a box to hold the battery in place
module battery_holder() {
    difference() {
        cube([battery_width + wall_thickness*2, battery_depth + wall_thickness*2, battery_height + wall_height], false);
        translate([wall_thickness, wall_thickness, base_height-0.001]) cube([battery_width, battery_depth, battery_height + wall_height + 0.002], false);
        translate([0, wall_thickness + battery_depth - cable_hole_width, base_height + cable_hole_offset]) cube([wall_thickness,cable_hole_width,battery_height + wall_height], false);
    }

    translate([0,0,battery_height]) cube([battery_width + wall_thickness*2, 5, hook_height], false);
}

color([0,1,0,0.5]) translate(battery_holder_pos) rotate([0,0,270]) battery_holder();

// This is a box to hold the speaker in place
module speaker() {
    speaker_width = 25;
    speaker_depth = 35;
    speaker_height = 6.3;
    wall_thickness = 1.5;
    cable_hole_width = 2;
    
    difference() {
        // Box
        translate([-wall_thickness, -wall_thickness, 0]) cube([speaker_width + wall_thickness * 2, speaker_depth + wall_thickness * 2, speaker_height-0.01]);
        
        // Speaker
        translate([0,0,-0.01]) cube([speaker_width, speaker_depth, speaker_height + 0.02]);

        // Cable hole
        translate([speaker_width / 2 - cable_hole_width/2,speaker_depth - 0.01, -0.01]) cube([cable_hole_width, wall_thickness+0.02, speaker_height + 0.02]);
    }
}

color([0,0,1,0.5]) translate(speaker_pos) speaker();

// This is a separate plastic piece taped to the speaker with the double sided tape of the speaker
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

if (show_speaker_adapter) {
    color([0,1,1,0.5]) translate(speaker_adapter_pos) speaker_adapter();
}
