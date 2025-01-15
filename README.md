# Safezone Script for FiveM Made by.: Bence

This script adds safe zones to your FiveM server, where players cannot engage in combat, use weapons, or damage others. It includes configurable zones with a visual representation on the map.

## Features
- Players within safe zones are invincible.
- Disables weapon usage, melee attacks, and vehicle damage in the zones.
- Configurable safe zone locations and sizes.
- Visual representation on the map with customizable blip color and transparency.

## Requirements
- FiveM server.
- ESX framework (version 1.2 or higher).

## Installation
1. Download or clone this repository.
2. Place the folder into your FiveM server's `resources` directory.
3. Add the following line to your `server.cfg`:
   ```plaintext
   start [folder_name]
   ```
4. Restart your server.

## Configuration
Modify the `config.lua` file to set up your safe zones. Each safe zone is defined by coordinates and radius:

```lua
Config.Safezones = {
    {coords = vector3(203.6131, -832.0588, 30.8422), radius = 149.1538},
    {coords = vector3(-267.1465, -958.4623, 31.2231), radius = 100.0},
    {coords = vector3(-203.4662, -1156.3706, 23.0488), radius = 100.0},
    {coords = vector3(-45.4297, -1114.4302, 26.4358), radius = 170.0},
    {coords = vector3(290.0861, -591.5021, 43.1807), radius = 90.0},
    {coords = vector3(427.9900, -980.8664, 30.7109), radius = 90.0},
    {coords = vector3(415.3216, -813.9279, 29.2403), radius = 15.0}
}
```

You can also customize the blip appearance on the map:

```lua
Config.BlipColor = 3 -- Dark Blue
Config.BlipAlpha = 128 -- Medium transparency (0-255)
```

## Usage
- Players within safe zones will automatically have combat actions disabled and become invincible.
- Players outside the safe zones will return to normal gameplay behavior.

## Contribution
Feel free to submit issues or pull requests to improve the script.

## License
This script is licensed under the MIT License. See `LICENSE` for details.

