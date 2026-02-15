# xhud

xhud is a FiveM HUD for ox_core or ESX Legacy.

## Dependencies

- ox_lib

This also requires a framework of your choice between ox_core and es_extended.  
Note that if you are using ESX, you will also need esx_status and esx_basicneeds.

## Download & Installation

- Go to the [releases page](https://github.com/Michatec/xhud/releases "Releases page") and download the latest release
- Place it inside the `resources` directory
- Add the resource to your `server.cfg` after dependencies to make sure it's started correctly at server startup:

``` command
ensure xhud
```

## Configuration

You can add these settings directly to your 'server.cfg', or add them to a separate file (i.e. hud.cfg) and call it with exec. **Convars must be set before starting xhud.**

The values below are defaults and should not be explicitly set unless changing the value.

``` yaml
### Shared

# Seabelt system
setr hud:seatbelt false

### Client

# Stress Indicator
setr hud:stress false

# Stamina Indicator
setr hud:stamina false

# Fuel Indicator
setr hud:fuel false

# Vehicles speed: "imperial" or "metric"
setr hud:unitsystem "imperial"

# Radar mode: by default, the radar is only enabled while sitting on a vehicle.
# Set this to true to have it always enabled. This will also enable the map cycler.
setr hud:persistentRadar false

# Radar shape
setr hud:circleMap true

# Keys for map cycler and seatbelt
setr hud:cyclemapKey "Z"
setr hud:seatbeltKey "B"

# Voice Indicator
setr hud:voice false

# Voice system: "pma-voice" or "saltychat"
setr hud:voiceService "pma-voice"

# Server logo
setr hud:logo true

# Version check against GitHub repo (Recommended)
setr hud:versioncheck true
```
