# Project: Dhycity (Luminus City)

## Concept
- 3D PC game in Godot.
- Single-player immersive world with one main building and an open area.
- Third-person view with gamepad/controller support.
- Characters: Main Player (Avaturn avatar) and "Mahdiya" (NPC).

## Code UI System Architecture
Modular layers:
1. **UI Layer**: CanvasLayer + Panel + LineEdit + Button.
2. **Command Parser**: Converts text to structured data (e.g., "spawn cube 5 2 3").
3. **Command Registry**: Defines allowed commands (spawn, teleport, set_speed, time, move_object).
4. **Execution Engine**: Applies changes to the game world.
5. **World Interface**: Bridge to player and scene nodes.

## Implementation Details
- Command behaviors include spawning objects, teleporting player, changing speed, and environmental changes.
- Debug logs for all actions.
- Script directory structure:
  - `/scripts/ui/`
  - `/scripts/parser/`
  - `/scripts/commands/`
  - `/scripts/core/`
