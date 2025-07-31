class Boss extends Enemy {
  String BOSS_NAME;
  
  //Compared to regular enemies, bosses do two attacks per turn rather than one.
  Boss(int ENEMY_ID) { 
    super(ENEMY_ID);
  }//Boss
  
  Attack[] determinemoveset(Attack[] moveset) {
    switch (ENEMY_ID) { 
        case 0: //Djinn (applies a variety of debuffs) 
          hp = 40;
          maxhp = 40;
          BOSS_NAME = "Djinn";
          moveset[0] = new Attack("Red Mist", 0, 2, 2); //2fire dmg
          moveset[1] = new Attack("Blue Mist", 2, 0, 3); //2dmg + freeze
          moveset[2] = new Attack("Green Mist", 0, 3, 1); //3poison dmg
          moveset[3] = new Attack("Purple Mist", 0, 0, 4); //weak
          moveset[4] = new Attack("Black Mist", 4, 0, 0); //4dmg
          break;
        case 1: //Basilisk (freeze alongside with poison)
          hp = 80;
          maxhp = 80;
          BOSS_NAME = "Basilisk";
          moveset[0] = new Attack("Petrify", 1, 0, 3); //1dmg + freeze
          moveset[1] = new Attack("Lunge", 7, 0, 0); //7dmg
          moveset[2] = new Attack("Poison Bite", 3, 4, 1); //3dmg + 4poison dmg
          moveset[3] = new Attack("Deadly Fumes", 2, 3, 1); //2dmg + 3poison dmg
          moveset[4] = new Attack("Radioactive Aura", 0, 6, 1); //6poison dmg
          break;
        case 2: //Reaper (utilizes vampirism and defense boosts)
          hp = 130;
          maxhp = 130;
          BOSS_NAME = "Reaper";
          moveset[0] = new Attack("Scythe Slash", 10, 0, 8); //10dmg + vampirism
          moveset[1] = new Attack("Fatal Blow", 12, 0, 8); //12dmg + vampirism
          moveset[2] = new Attack("Soul Spectre", 5, 0, 7); //5dmg + deal 25% less damage 
          moveset[3] = new Attack("Eviscerate", 15, 0, 0); //15dmg
          moveset[4] = new Attack("Soul Barrier", 5, 0, 7); //5dmg + deal 25% less damage 
          break;
        case 3: //Astral Deity (Absurdly high damage)
          hp = 250;
          maxhp = 250;
          BOSS_NAME = "Astral Deity";
          moveset[0] = new Attack("Sunlight Spear", 25, 5, 2); //25dmg + 5fire dmg
          moveset[1] = new Attack("Unbreakable Nexus", 30, 0, 7); //30dmg + deal 25% less damage 
          moveset[2] = new Attack("Envenomed Spirit", 25, 7, 1); //25dmg + 7poison dmg
          moveset[3] = new Attack("Charge", 0, 0, 0); //0dmg
          moveset[4] = new Attack("Charge", 0, 0, 0); //0dmg
          break;
    }
    return moveset;
  }//determinemoveset
  
  void display() {
    switch (ENEMY_ID) {
      case 0:
        image = djinn;
        image.resize(800,500);
        image(image, -100, 100);
        break;
      case 1:
        image = basilisk;
        image.resize(400,400);
        image(image, 100, 180);
        break;
      case 2:
        image = reaper;
        image.resize(400,400);
        image(image, 100, 150);
        break;
      case 3:
        image = god;
        image.resize(400,400);
        image(image, 100, 100);
        break;
    }
  }//display   
  Attack chooseattack() {
    Attack attack = moveset[int(random(moveset.length))];
    return attack;
  }//chooseattack
  
  void doublestrike(Attack attack0, Attack attack1) {
    calculatedmg(attack0);
    calculatedmg(attack1);
  }//doublestrike
  
}//Boss
