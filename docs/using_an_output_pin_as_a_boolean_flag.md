# Using an output pin as a boolean flag


Configured pin
```
[output_pin statex]
pin: PC11
value: 1
```

Reading pin state and doing something based on value
```
[macro DO_STUFF_IF_OTUPUT_PIN_1]
gcode:
  {% if printer["output_pin statex"].value == 1.0 %}
    G0 X10
  {% else %}
    G0 X20
  {% endif %}
```

Writing pin state
```
[macro CHANGE_PIN_STATEX]
gcode:
  SET_PIN PIN=statex VALUE=0
```

