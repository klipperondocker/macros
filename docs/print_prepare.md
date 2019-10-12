# Print prepare


```
[gcode_macro print_prepare TEMP_BED TEMP_EXTRUDER]
variable_parameter_TEMP_BED: 60
variable_parameter_TEMP_EXTRUDER: 190
variable_parameter_PERCENT_BED_READY: 0.85
gcode:
    
    # Stop part cooling fan if running
    {% if printer.fan.speed > 0.0 %}
    M106 S0
    {% endif %}

    # Heating
    # - heat bed up to 85% (or whatever PERCENT_BED_READY is set to)
    # - set bed to heat to 100%
    # - set extruder to heat to 100%
    # - wait for extruder to finish heating
    # - wait for bed to finish heating

    M140 S{TEMP_BED}
    {% if printer.heater_bed.temperature < params.TEMP_BED|float* params.PERCENT_BED_READY|float %}
        M190 S{params.TEMP_BED|float*params.PERCENT_BED_READY|float} 
    {% endif %}
    
    M140 S{TEMP_BED} 
    M109 S{TEMP_EXTRUDER}
    M190 S{TEMP_BED}
    
    # Home
    G28
    
    # Use the bed mesh 
    BED_MESH_PROFILE LOAD=default
```

Inspiration
* https://github.com/fl0r1s/cr10_klipper/blob/master/macros.cfg
