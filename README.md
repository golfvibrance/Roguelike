# NeXTCS Final Project
### Name 0: Jonathan Lau
---

### Project Description
Provide a high-level description of your project. Include explanatory links if you think they will be helpful.
I am planning on making a primitive version of a roguelike with an inventory based mechanic. You will have x amount of energy per turn and using anything in the backpack will use one energy. This amount of energy will be increased after every x amount of fights won (or maybe implement this in the possibly added shop). You will go on to the next area whenever the energy cap is increased. There will be 3-4 areas, most likely with 5 unique enemies per area. An enemy will be chosen based off a randomized ID for every area that will do different attacks based on a randomized ID for that respective enemy as well (there will be a placeholder enemy that tests everything in the beginning). Once all your energy is used up, if the enemy is not already defeated, it will attack the player and deal damage, thereby lowering your HP. After this, there is a chance to get the options of gaining gold, a weapon/defensive item, or to heal a certain percentage of health. Every couple enemies, there will be a boss/elite enemy that can deal two attacks at once. (possibly inflict a debuff while attacking?) These fights will guarantee a permanent buff to a chosen stat.

Optionally added:
Perhaps there will be a third item (armor) that will increase max HP (or maybe max HP will be upgradable using gold). 
If there is time to code it, you will have the option to skip the elite fight (with the exception of the final boss fight, which will not grant any rewards.

shop (chance after beating an enemy) + ability to remove items from inventory
events (chance after beating an enemy)
inventory slot buffs
relics (permanent buffs that last throughout a run)
ability for enemies to prevent use of items?
multi-wave fights?
endless mode?

 
### Class Topic Usage
Explain what topics from this year you will be using in this project, and how they will be used.
image processing (image of enemy, weapons maybe, and in general most things in the GUI)
2d array/arraylist (inventory will use one of the two)
keyboard/mouse input (to interact with the gui)
may use subclasses for the different buffs that can be applied to individual backpack slots

### Libraries (delete if not using libraries)
List any libraries you will be using and why.
Probably something from the audio library for music, but this may or may not happen.
