# Macro variables usage

Set variables with default value and gcode that does nothing
```
[gcode_macro CONFIGS]
variable_my_stored_variable: 0
gcode:
  M118 Stored variable as {printer["gcode_macro CONFIGS"].my_stored_variable}
```


Use those variables in another macro
```
[gcode_macro PRINT_STORED_VARIABLE]
gcode:
  M118 Value is {printer[gcode_macro CONFIGS"].my_stored_variable}
```

Change the variables from another macro
```
[gcode_macro SET_VAR_TO_1]
gcode:
  SET_GCODE_VARIABLE MACRO=CONFIGS VARIABLE=my_stored_variable VALUE=1
  M118 Changed!
```

Source:
- https://github.com/KevinOConnor/klipper/blob/master/docs/Command_Templates.md
