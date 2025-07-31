class Guide {
  Guide() {
  }//Guide
  
  void display(int x, int y) {
    fill(#E5BE9E);
    strokeWeight(10);
    rect(x, y-70, 495, 590);
    textSize(40);
    fill(0);
    textAlign(CENTER, LEFT);
    text("GUIDE/TIPS",x+235,y-20);
    textSize(16);
    textAlign(LEFT);
    text("You have 3 energy which is depleted by 1 whenever you attack or\ndefend. The effectiveness of attacking and defending is based off\nyour ATK and DEF stats. If energy is 0, you can still use items in\nyour inventory. Defense doesn't carry over turns. There are\nvarious effects that enemies can apply onto you or themselves.\nDebuffs cleanse after winning a fight and you will gain a bit of gold too.\nUse your gold to buy shop items and upgrades, but spend wisely.\n\nDebuffs and Effects\npoison: deal poison damage and then tick down by 1 (cannot stack)\nfire: deal fire damage and then tick down by 1 (can stack)\nfreeze: disable inventory next turn\nweaken: take 40% more dmg next turn\nrob: take 20% of players current gold\ndisabled: enemy will not attack next turn\ndefending: deal 25% less damage next turn\nvampirism: heal 50% of dealt damage as health\n\nItems\nHealth Potion (Red Flask): Heal 10 HP (doesn't overheal)\nAntivenom (Bubbly Flask): -2 poison stacks\nLiquid Nitrogen (Bucket): -3 fire stacks\nAdrenaline (Green Vial): +1 energy\nShieldbreaker (Broken Shield): negate the effects of defending this turn\nStrength Sigil (Flex): negate the effects of weak this turn\nDivine Aegis (Shield): defending is twice as effective this turn\n\nIf you end up dying while testing, press o for a cheat code!", x+10, y+10);  
  }//display
}
