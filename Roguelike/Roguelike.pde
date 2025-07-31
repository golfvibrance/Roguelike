//Instance Variables

//PImages
PImage skull;
PImage bp;
PImage potion, antivenom, nitrogen, adren, sbreak, strength, divine; //images for inventory items
PImage rat, slime, goblin, thief, djinn; //area 1 enemies
PImage ent, orc, bear, wolf, basilisk; //area 2 enemies
PImage mimic, golem, mage, demon, reaper; //area 3 enemies
PImage dragon, construct, necro, wraith, god; //area 4 enemies
PImage bg1, bg2, bg3, bg4, bg5; //backgrounds
PImage image;

int ENEMIES_KILLED = 0;
int CURRENT_AREA = 1;
int CURRENT_MENU = 0;

int ENERGY = 3;
int MAX_ENERGY = 3;
int GOLD = 0;
int INVENTORY_SLOTS = 8;
int HP = 40;
int MAX_HP = 40;
int DEF = 2;
int CURRENTDEF = 0;
int ATK = 4;
int ENEMY_HP;
int ENEMY_MAX_HP;

//upgrades
int HPUPGRADE = 0;
int MAXHPUPGRADE = 10;
int ATKUPGRADE = 0;
int MAXATKUPGRADE = 10;
int DEFUPGRADE = 0;
int MAXDEFUPGRADE = 10;

Inventory backpack = new Inventory();
Guide guide = new Guide();
Shop shop = new Shop(10);
PlayerBar hpbar = new PlayerBar();
EnemyBar enemyhpbar = new EnemyBar();
ArrayList<Button> buttons = new ArrayList<Button>();

Enemy enemy = chooseEnemy();
Attack plannedattack = enemy.chooseattack();
Boss boss = chooseBoss();
Attack plannedattack0 = boss.chooseattack();
Attack plannedattack1 = boss.chooseattack();

boolean fightingboss = false;
boolean enemydead = false;
boolean win = false;
boolean dead = false;

//damage + statuses 
int dmg = 0;
int poisondmg = 0;
int firedmg = 0;
boolean frozen = false; 
boolean isFrozen = false;
boolean weak = false;
boolean isWeakened = false;
boolean robbed = false;
boolean disabled = false;
boolean isDisabled = false;
boolean defending = false;
boolean isDefending = false;
boolean vampirism = false;
boolean defenseboost = false;

void setup() {
  size(1100,700);
  buttons.add(new Button(0,575,1));
  buttons.add(new Button(150,575,2));
  buttons.add(new Button(300,575,3));
  buttons.add(new Button(500,150,75,4));
  buttons.add(new Button(500,300,75,5));
  buttons.add(new Button(500,450,75,6));
  skull = loadImage("skull.png");
  rat = loadImage("rat.png");
  slime = loadImage("slime.png");
  goblin = loadImage("goblin.png");
  thief = loadImage("thief.png");
  djinn = loadImage("djinn.png");
  ent = loadImage("ent.png");
  orc = loadImage("orc.png");
  bear = loadImage("bear.png");
  wolf = loadImage("wolf.png");
  basilisk = loadImage("basilisk.png");
  mimic = loadImage("mimic.png");
  golem = loadImage("golem.png");
  mage = loadImage("mage.png");
  demon = loadImage("demon.png");
  reaper = loadImage("reaper.png");
  dragon = loadImage("dragon.png");
  construct = loadImage("construct.png");
  necro = loadImage("necromancer.png");
  wraith = loadImage("wraith.png");
  god = loadImage("god.png");
  bp = loadImage("backpack.png");
  potion = loadImage("potion.png");
  antivenom = loadImage("antivenom.png");
  nitrogen = loadImage("nitrogen.png");
  adren = loadImage("adrenaline.png");
  sbreak = loadImage("shieldbreak.png");
  strength = loadImage("strength.png");
  divine = loadImage("divine.png");
  bg1 = loadImage("bg1.png");
  bg2 = loadImage("bg2.png");
  bg3 = loadImage("bg3.png");
  bg4 = loadImage("bg4.png");
  bg5 = loadImage("bg5.png");
}//setup

void draw() {
  background(255);
  switch (CURRENT_AREA) {
    case 1:
      bg1.resize(600,520);
      image(bg1,0,100);
      break;
    case 2:
      bg2.resize(600,520);
      image(bg2,0,100);
      break;
    case 3: 
      bg3.resize(600,520);
      image(bg3,0,100);
      break;
    case 4: 
      bg4.resize(600,520);
      image(bg4,0,100);
      break;
    case 5:
      bg5.resize(600,520);
      image(bg5,0,100);
      break;
  }
  if (!win) {
    if (enemy.hp <= 0) {
        resetStatus();
        enemydead = true;
        ENEMIES_KILLED++;
        if ((ENEMIES_KILLED+1) % 5 ==0) {
          fightingboss = true;
        }
    }
    else if (!fightingboss) {
      enemy.display();
    }
    if (boss.hp <= 0) {
        resetStatus();
        enemydead = true;
        ENEMIES_KILLED++;
        CURRENT_AREA++;
        if (boss.ENEMY_ID == 3) {
          win = true;
        }
        fightingboss = false;
    }
    else if (fightingboss) {
      boss.display();
    }
  }
  if (enemydead) {
    switch (CURRENT_AREA) {
      case 1:
        GOLD += 70;
        break;
      case 2:
        GOLD += 90;
        break;
      case 3:
        GOLD += 110;
        break;
      case 4:
        GOLD += 150;
        break;
      case 5:
        GOLD += 1000;
        break;
    }
    enemy = chooseEnemy();
    plannedattack = enemy.chooseattack();
    boss = chooseBoss();
    plannedattack0 = boss.chooseattack();
    plannedattack1 = boss.chooseattack();
    ENERGY = MAX_ENERGY;
    CURRENTDEF = 0;
    enemydead = !enemydead;
  }
  switch (CURRENT_MENU) {
    case 0:
      guide.display(600,175);
      break;
    case 1:
      backpack.display(600, 175, 125, INVENTORY_SLOTS);
      break;
    case 2: 
      shop.display();
      break;
  }
  hpbar.display();
  enemyhpbar.display();
  for (Button button : buttons) {
    button.display();
  }
}//draw

void resetStatus() {
  poisondmg = 0;
  firedmg = 0;
  frozen = false; 
  isFrozen = false;
  weak = false;
  isWeakened = false;
  robbed = false;
  disabled = false;
  isDisabled = false;
  defending = false;
  isDefending = false;
  vampirism = false;
  defenseboost = false;
}//resetStatus

void keyPressed() {
  if (key == 'o') {//cheat code for testing purposes (death defiance, etc.)
    ATK = 100;
    DEF = 100;
    GOLD = 1000;
    MAX_HP = 100;
    HP = 100;
    dead = false;
  }
}//keyPressed

void mousePressed() {
  for (Button button : buttons) {
    if (button.mouseIsOver()) {
      button.function();
    }
  }
  if (CURRENT_MENU == 1 && !isFrozen) {
    int slotIndex = backpack.getSlotIndex(mouseX, mouseY);
    backpack.useItem(slotIndex);
  }
  if (CURRENT_MENU == 2) {
    shop.buyItem();
  }
}//mousePressed

Enemy chooseEnemy() {
  Enemy enemy = new Enemy(0); //placeholder is Rat
  if (CURRENT_AREA == 1) {
    enemy = new Enemy(int(random(0,4)));
  }
  else if (CURRENT_AREA == 2) {
    enemy = new Enemy(int(random(4,8)));
  }
  else if (CURRENT_AREA == 3) {
    enemy = new Enemy(int(random(8,12)));
  }
  else if (CURRENT_AREA == 4) {
    enemy = new Enemy(int(random(12,16)));
  }
  return enemy;
}//chooseEnemy

Boss chooseBoss() {
  Boss boss = new Boss(0);
  if (CURRENT_AREA == 1) {
    boss = new Boss(0);
  }
  else if (CURRENT_AREA == 2) {
    boss = new Boss(1);
  }
  else if (CURRENT_AREA == 3) {
    boss = new Boss(2);
  }
  else if (CURRENT_AREA == 4) {
    boss = new Boss(3);
  }
  return boss;
}//chooseBoss
