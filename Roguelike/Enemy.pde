class Enemy {
  int hp;
  int maxhp;
  int ENEMY_ID;
  String ENEMY_NAME;
  Attack[] moveset;
  //FINISH DISPLAY ENEMY (PIMAGES)
  //START CODING ITEMS FOR INVENTORY (WEAPONS SHOULD BE DONE FIRST)
  
  Enemy(int ENEMY_ID) {
    this.ENEMY_ID = ENEMY_ID;
    moveset = determinemoveset(new Attack[5]);
  }//Enemy
  
  Attack[] determinemoveset(Attack[] moveset) {
    //area 1 enemies
      switch (ENEMY_ID) { 
        case 0: //Rat (Basic attacks)
          hp = 30;
          maxhp = 30;
          ENEMY_NAME = "Rat";
          moveset[0] = new Attack("Gnaw", 4, 0, 0); //4dmg
          moveset[1] = new Attack("Acid Spit", 2, 2, 1); //2dmg + 2poison dmg
          moveset[2] = new Attack("Tail Whip", 2, 0, 4); //2dmg + weaken
          break;
        case 1: //Slime (Specializes in stacking fire on player)
          hp = 20;
          maxhp = 20;
          ENEMY_NAME = "Slime";
          moveset[0] = new Attack("Corrode", 0, 3, 2); //3fire dmg
          moveset[1] = new Attack("Goo Bomb", 1, 2, 2); //1dmg + 2fire dmg
          moveset[2] = new Attack("Dematerialize", 0, 0, 4); //weaken
          break;
        case 2: //Goblin (High damage, chance to miss)
          hp = 25;
          maxhp = 25;
          ENEMY_NAME = "Goblin";
          moveset[0] = new Attack("Stab", 7, 0, 0); //7dmg
          moveset[1] = new Attack("Bite", 4, 2, 1); //4dmg + 2poison dmg
          moveset[2] = new Attack("Stumble", 0, 0, 0); //0dmg
          break;  
        case 3: //Thief (Low damage, annoying debuffs)
          hp = 35;
          maxhp = 35;
          ENEMY_NAME = "Thief";
          moveset[0] = new Attack("Loot", 2, 0, 5); //2dmg + steal 20% of players current gold
          moveset[1] = new Attack("Blind", 2, 0, 3); //2dmg + freeze
          moveset[2] = new Attack("Knife Flurry", 0, 4, 1); //4poison dmg
          break;
    //area 2 enemies
        case 4: //Ent (weakens/poisons on every attack)
          hp = 45;
          maxhp = 45;
          ENEMY_NAME = "Ent";
          moveset[0] = new Attack("Uproot", 10, 0, 4); //10dmg + weaken
          moveset[1] = new Attack("Crush", 9, 0, 4); //9dmg + weaken
          moveset[2] = new Attack("Hand Swipe", 6, 3, 1); //6dmg + 3poison dmg
          break;
        case 5: //Blind Orc (Super high damage, but only for one move)
          hp = 55;
          maxhp = 55;
          ENEMY_NAME = "Blind Orc";
          moveset[0] = new Attack("Stumble", 0, 0, 0); //0dmg
          moveset[1] = new Attack("Stumble", 0, 0, 0); //0dmg
          moveset[2] = new Attack("Obliterate", 20, 0, 0); //20dmg
          break;
        case 6: //Bear (High damage, but needs to rest after every turn)
          hp = 50;
          maxhp = 50;
          ENEMY_NAME = "Bear";
          moveset[0] = new Attack("Maul", 15, 0, 6); //15dmg + disable
          moveset[1] = new Attack("Swipe", 13, 0, 6); //13dmg + disable
          moveset[2] = new Attack("Bite", 14, 0, 6); //14dmg + disable
          break;  
        case 7: //Wolf (Basic attacks, can increase defense)
          hp = 40;
          maxhp = 40;
          ENEMY_NAME = "Wolf";
          moveset[0] = new Attack("Howl", 8, 0, 7); //8dmg + deal 25% less damage
          moveset[1] = new Attack("Hunt", 11, 0, 3); //11dmg + freeze
          moveset[2] = new Attack("Rabid Grip", 5, 4, 1); //5dmg + 4poison dmg
          break;
    //area 3 enemies      
        case 8: //Mimic (drops more gold than usual)
          hp = 100;
          maxhp = 100;
          ENEMY_NAME = "Mimic";
          moveset[0] = new Attack("Chomp", 21, 0, 0); //21dmg
          moveset[1] = new Attack("Molten Gold", 13, 6, 2); //13dmg + 6fire dmg
          moveset[2] = new Attack("Tongue Lash", 12, 0, 3); //12dmg + freeze
          break;
        case 9: //Golem (enormous maxhp pool with great defense but weak damage)
          hp = 120;
          maxhp = 120;
          ENEMY_NAME = "Golem";
          moveset[0] = new Attack("Stone Wall", 20, 0, 7); //20dmg + deal 25% less damage
          moveset[1] = new Attack("Crystalize", 17, 0, 7); //17dmg + deal 25% less damage
          moveset[2] = new Attack("Bash", 9, 0, 4); //9dmg + weaken
          break;
        case 10: //Archmage (uses fire and freeze attacks alongside moderate damage)
          hp = 95;
          maxhp = 95;
          ENEMY_NAME = "Archmage";
          moveset[0] = new Attack("Cyroball", 20, 0, 3); //20dmg + freeze
          moveset[1] = new Attack("Fireball", 16, 4, 2); //16dmg + 4fire dmg
          moveset[2] = new Attack("Magic Missile", 10, 4, 2); //10dmg + 4fire dmg
          break;
        case 11: //Demon (uses fire alongside nasty debuffs)
          hp = 100;
          maxhp = 100;
          ENEMY_NAME = "Demon";
          moveset[0] = new Attack("Slash", 20, 2, 2); //20dmg + 2fire dmg
          moveset[1] = new Attack("Internal Combustion", 0, 7, 2); //7fire dmg
          moveset[2] = new Attack("Intimidate", 10, 0, 4); //10dmg + weaken
          break;
    //area 4 enemies (final area)
        case 12: //Dragon (stacks fire a lot)
          hp = 120;
          maxhp = 120;
          ENEMY_NAME = "Dragon";
          moveset[0] = new Attack("Flame Breath", 0, 8, 2); //8fire dmg
          moveset[1] = new Attack("Blazen Swipe", 20, 5, 2); //20dmg + 5fire dmg
          moveset[2] = new Attack("Inferno", 0, 5, 2); //5fire dmg
          break;
        case 13: //Glacial Construct (gimmick fight, freezes on almost every turn)
          hp = 170;
          maxhp = 170;
          ENEMY_NAME = "Glacial Construct";
          moveset[0] = new Attack("Frostbite", 23, 0, 3); //23dmg + freeze
          moveset[1] = new Attack("Ice Winds", 20, 0, 3); //20dmg + freeze
          moveset[2] = new Attack("Frigid Touch", 8, 0, 4); //8dmg + weaken
          break;
        case 14: //Necromancer (Damage it deals, heals some back)
          hp = 135;
          maxhp = 135;
          ENEMY_NAME = "Necromancer";
          moveset[0] = new Attack("Life Steal", 16, 0, 8); //16dmg + vampirism
          moveset[1] = new Attack("Atrophy", 18, 0, 8); //18dmg + vampirism
          moveset[2] = new Attack("Blood Ritual", 20, 0, 8); //20dmg + vampirism
          break;
        case 15: //Chaos Wraith (Ultra high maxhp with weaken and extreme damage)
          hp = 150;
          maxhp = 150;
          ENEMY_NAME = "Chaos Wraith";
          moveset[0] = new Attack("Transmogrify", 15, 0, 4); //15dmg + weaken
          moveset[1] = new Attack("Malevolent Blitz", 25, 0, 6); //25dmg + disable
          moveset[2] = new Attack("Shadow Rush", 30, 0, 6); //30dmg + disable
          break;
      }
    return moveset;
  }//determinemoveset
  
  Attack chooseattack() {
    Attack attack = moveset[int(random(3))];
    if (isDisabled) {
      attack = new Attack("Disabled", 0, 0, 0);
    }
    return attack;
  }//chooseattack
  
  void calculatedmg(Attack attack) {
    dmg += attack.dmg;
    switch (attack.type) {
      case 1:
        if (attack.debuffdmg > poisondmg) {
          poisondmg = attack.debuffdmg;
        }
        break;
      case 2:
        firedmg += attack.debuffdmg;
        break;
      case 3:
        frozen = true;
        break;
      case 4:
        weak = true;
        break;
      case 5:
        robbed = true;
        break;
      case 6:
        disabled = true;
        break;
      case 7:
        defending = true;
        break;
      case 8:
        vampirism = true;
        break;
    }
  }//calculatedmg
  
  void applydmg() {
    int totaldmg = 0;
    totaldmg += dmg;
    dmg = 0;
    totaldmg += poisondmg;
    if (poisondmg != 0) {
      poisondmg--;
    }
    totaldmg += firedmg;
    if (firedmg != 0) {
      firedmg--;
    }
    isFrozen = frozen; 
    frozen = false; 
    if (isWeakened) {
      totaldmg = round(1.4 * totaldmg);
    }
    isWeakened = weak; 
    weak = false; 
    if (vampirism) {
      hp += round(totaldmg*0.5);
      if (hp > maxhp) {
        hp = maxhp;
      }
      vampirism = false;
    }
    totaldmg -= CURRENTDEF;
    if (totaldmg < 0) {
      totaldmg = 0;
    }
    HP -= totaldmg;
  }//applydmg
    
  void applymisc() {
    if (robbed) {
      GOLD *= 0.8;
      robbed = false;
    }
    isDisabled = disabled; 
    disabled = false; 
    isDefending = defending; 
    defending = false; 
  }//applymisc
  
  void display() {
    switch (ENEMY_ID) {
        case 0:
            image = rat;
            image.resize(400,400);
            image(image, 100, 200);
            break;
        case 1:
            image = slime;
            image.resize(300,300);
            image(image, 125, 200);
            break;
        case 2:
            image = goblin;
            image.resize(250,300);
            image(image, 150, 200);
            break;
        case 3:
            image = thief;
            image.resize(300,400);
            image(image, 100, 125);
            break;
        case 4:
            image = ent;
            image.resize(300,400);
            image(image, 110, 145);
            break;
        case 5:
            image = orc;
            image.resize(300,400);
            image(image, 125, 125);
            break;
        case 6:
            image = bear;
            image.resize(300,300);
            image(image, 100, 220);
            break;
        case 7:
            image = wolf;
            image.resize(450,275);
            image(image, 50, 300);
            break;
        case 8:
            image = mimic;
            image.resize(300,300);
            image(image, 125, 250);
            break;
        case 9:
            image = golem;
            image.resize(300,400);
            image(image, 100, 125);
            break;
        case 10:
            image = mage;
            image.resize(300,400);
            image(image, 100, 125);
            break;
        case 11:
            image = demon;
            image.resize(400,400);
            image(image, 100, 125);
            break;
        case 12:
            image = dragon;
            image.resize(500,400);
            image(image, 50, 125);
            break;
        case 13:
            image = construct;
            image.resize(300,400);
            image(image, 100, 125);
            break;
        case 14:
            image = necro;
            image.resize(300,400);
            image(image, 100, 125);
            break;
        case 15:
            image = wraith;
            image.resize(300,400);
            image(image, 100, 125);
            break;
    }
  }//display
  
}//Enemy
