class EnemyBar extends PlayerBar {
  ArrayList<String> debuffs = new ArrayList<String>();
  
  EnemyBar() {
    x = 0;
    y = 0;
    w = 1100;
    h = 100;
  }//EnemyBar
  
  EnemyBar(int bx, int by, int bw, int bh) {
    super(bx,by,bw,bh);
  }//EnemyBar
  
  void display() {
    fill(#9EC5E5);
    stroke(0);
    strokeWeight(10);
    rect(x, y, w, h, 16);
    textSize(25);
    fill(0);
    textAlign(LEFT, TOP);
    if (!win) {
      if (fightingboss) {
        text("BOSS STATS", x+10, y+10);
        text("BOSS: " + boss.BOSS_NAME + (isDefending ? " (DEFENDING)" : ""), x+175, y+10);
        text("HP: " + boss.hp + "/" + boss.maxhp, x+10, y+35);
        text("INTENT: " + intent(plannedattack0), x+175, y+35);
        text(intent(plannedattack1), x+265, y+60);
      }
      else {
        text("ENEMY STATS", x+10, y+10);
        text("ENEMY: " + enemy.ENEMY_NAME + (isDefending ? " (DEFENDING)" : ""), x+190, y+10);
        text("HP: " + enemy.hp + "/" + enemy.maxhp, x+10, y+35);
        text("INTENT: " + intent(plannedattack), x+190, y+35);
      }
    textSize(25);
    text("CURRENT DEBUFFS", x+670, y+10);
    debuffstr();
    String debuffline = ""; 
    for (String debuff : debuffs) {
      debuffline += debuff;
    }
    text(debuffline,x+670,y+35);
    }
    else { 
      textSize(50);
      text("YOU WIN! YOU ARE A MASTERFUL TACTICIAN.", x+100, y+35);
    }
  }//display
  
  String intent(Attack attack) {
    String intent = "";
    intent = attack.ATTACK_ID + ((attack.dmg == 0 && attack.debuffdmg == 0 && attack.type == 0) ? " MISS" : (" (" + ((attack.dmg == 0) ? "" : attack.dmg + "dmg") + dealingwithdebuffs(attack) + ")"));
    return intent;
  }//intent
  
  void debuffstr() {
    debuffs.clear();
    if (poisondmg > 0) {
      debuffs.add(poisondmg+"poison ");
    }
    if (firedmg > 0) {
      debuffs.add(firedmg+"fire ");
    }
    if (isFrozen) {
      debuffs.add("frozen ");
    }
    if (isWeakened) {
      debuffs.add("weak ");
    }
  }//debuffstr
  
  String dealingwithdebuffs(Attack attack) {
    String debuffstr = " + ";
    if (attack.dmg == 0) {
      debuffstr = "";
    }
    switch (attack.type) {
      case 0:
        debuffstr = "";
        break;
      case 1:
        debuffstr += attack.debuffdmg + "psn";
        break;
      case 2:
        debuffstr += attack.debuffdmg + "fire";
        break;
      case 3: 
        debuffstr += "frozen";
        break;
      case 4: 
        debuffstr += "weaken";
        break;
      case 5:
        debuffstr += "rob";
        break;
      case 6:
        debuffstr += "disabled";
        break;
      case 7:
        debuffstr += "defending";
        break;
      case 8:
        debuffstr += "vampirism";
        break;
    }
    return debuffstr;
  }//dwd
}
