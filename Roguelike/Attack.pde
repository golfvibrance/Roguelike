class Attack {
  String ATTACK_ID;
  int dmg;
  int debuffdmg;
  int type;
  
  Attack(String ATTACK_ID, int dmg, int debuffdmg, int type) {
    this.ATTACK_ID = ATTACK_ID; //id of attack (how to get name of attack)
    this.dmg = dmg; //regular damage that will be done
    this.debuffdmg = debuffdmg; //special damage that will be done
    this.type = type; //special types of damage
  }//Attack  
  
  //TYPES OF EFFECTS (regular damage is type 0) 
  //Debuffs cleanse after winning a fight
  //poison: deal debuffdmg and then tick down by 1 (cannot stack) type 1
  //fire: deal debuffdmg and then tick down by 1 (can stack) type 2
  //freeze: disable inventory next turn (subject to change) type 3
  //weaken: take 40% more dmg next turn (subject to change) type 4
  //robbed: take 20% of players current gold (subject to change) type 5
  //disable: will not attack next turn type 6
  //defense: deal 25% less damage next turn type 7
  //vampirism: heal 50% of dealt damage as health type 8

  
  
}//Attack
