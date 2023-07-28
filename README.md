# The serial_y_cable Tool

## Usage
```
basic usage of serial_y_cable:

     ┌─────────────────┐                                                                     ┌────────────────────────────────┐
     │ hardware / DUT  ├──  hardware serial dev   ─────┬───────  virtual serial dev 0  ──────┤ application that controls      │
     └─────────────────┘      e.g.://dev/ttyUSB0       │          /tmp/ttyUSB0-V0            │ the hardware / DUT             │
                                                       │                                     └────────────────────────────────┘
                                                       │
                                                       │                                     ┌────────────────────────────────┐
                                                       └───────  virtual serial dev 1  ──────┤ serial terminal for monitoring │
                                                                   /tmp/ttyUSB0-V0           │  - e.g. minicom, screen, etc.  │
                                                                                             └────────────────────────────────┘

```


## Limitations

For now only monitoring is implemented (bytes are only copied from the hardware side to the virtual devices).
