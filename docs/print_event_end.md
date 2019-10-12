# Printing ended

```
[gcode_macro print_event_end]
gcode:

    # move z up
    G91
    G1 Z+10

    # retract
    G1 E-3 F300
    
    # move printhead to a specific position
    G90
    G1 X10 Y220 F2000

    # Disable heaters
    M104 S0
    M140 S0
    
    
    # disable steppers
    M84 

    # disable bed mesh
    BED_MESH_CLEAR
```