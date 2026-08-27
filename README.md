**The Dungeons** was one of the earliest computer games I ever played on the Commodore 64 back int the 1980's. I may have played the earlier version on the Commodore VIC-20 as well at some point; as I played a lot of Dungeons & Dragons back then so the game really appealed to the younger me.

The source code in this repository is a deconstructed version of the game from a PRG file into its major component parts allowing it to be re-built using the code and the Visual Studio Code extension VS64 in conjunction with the ACME assembler.  It also contains some useful background material about the game gathered from a variety of sources across the internet.

Disclaimer:  I have used AI (Claude and CoPilot) to help with some of the tricker pieces of getting this fully working, but the core BASIC game code and assets all remain untouched from the original game.

# History of the game

Anirog Software Ltd. was a prominent early British video game publisher founded in 1982.  The company was formed in 1982 by Anil Gupta and Roger Gamon. They combined their first names (ANIl + ROGer) to create the brand.

The two programmers behind The Dungeons (1983) were Brian Clark and Marian Clark.  Brian Clark and Marian Clark were a British husband-and-wife developer duo.  In the early 1980s, game design was rarely siloed into large teams. Brian and Marian Clark worked closely together to handle nearly every facet of development across multiple systems, including the Commodore 64, BBC Micro, and Acorn Electron.

Brian Clark primarily headed up the structural programming loops, translating complex text parsers and grid logic into machine-readable code. Both Marian and Brian are credited jointly with creating the high-resolution wireframe, graphic tiles, and visual assets. On a project like The Dungeons, they also worked with writer Gill Baldwin, who provided the underlying narrative structure and text elements.


The Dungeons formed part of a trilogy:
- The Dungeons (1983): Their breakthrough title, introducing players to line-drawn wireframe corridors and a strict keyboard-action grid map.
- The Dark Dungeons (1983): Released later that same year, this direct sequel expanded the environment footprint and optimized combat pacing.
- The Catacombs (1984): The final entry in the trilogy. It took a massive leap forward by implementing complex RPG elements, a character role-selection screen (allowing users to play as either a fighter named Duke or a cunning Witch), and interactive non-player characters (NPCs) you could talk to or fight.


### The Evolution Matrix (1983–1984)
| Mechanic| The Dungeons (1983) | The Dark Dungeons (1983) | The Catacombs (1984) | 
|---------|---------------------|--------------------------|----------------------|
| Visual Style | Continuous line-drawn 3D wireframes | Pitch-black rooms; requires Lantern light | Static screen illustrations + descriptions | 
| Control Scheme | Pure directional movement mapping | Complex command key shortcodes | Full interactive text input parser (TALK, TAKE) |
| Character Depth| Fixed health and currency states | Rolled stats; pick Fighter or Mage | Asymmetric Hero Classes (Duke vs. Hos Witch) |
| Primary Goal | Escape the layout maze grid | Locate a riddle scroll; manage money| Fetch ingredients to cure a village plague| 

References & Links
* VS64 - A C64 Development Environment extension for Visual Studio Code : https://github.com/rolandshacks/vs64
* ACME Cross-Assembler - a multi-platform cross assembler for 6502/6510/65816 CPU's : https://sourceforge.net/projects/acme-crossass/
