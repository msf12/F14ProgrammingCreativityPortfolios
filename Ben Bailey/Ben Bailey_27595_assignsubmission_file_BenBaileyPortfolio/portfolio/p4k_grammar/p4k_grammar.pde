// p4k_grammar
// by Ben Bailey, bennettbailey@gmail.com


import java.awt.TextArea; 

TextArea screen_text;

void setup() {
  size(600, 500);
  background(255);
  screen_text = new TextArea("", 30, 50, 1); 
  this.add(screen_text);
  noLoop();
}

// word banks

String[] oldBands = {
  "Sonic Youth", "Swans", "King Crimson", "Arcade Fire", "Aphex Twin", "Radiohead", "Morrissey"
};

String[] decades = {
  "00s", "10s", "60s", "70s", "80s", "90s"
};

String[] pretentious_words = {
  "juxtaposition", "dichotomy", "dissonance"
};

String[] modifiers = {
  "quietly ambitious", "sophomoric", "warped", "decisively analog", "cliche", "trite", "intimate", "idiosyncratic", "effortless", "cerebral", "anxious", "scarecrow-genius"
};

String[] nouns = {
  "romp", "journey", "meditation", "concept", "pilgrimage", "odyssey"
};

String[] p4k = {
  "The whole record crackles with electricity.", "Though the music might sound pricier than ever, the basic architecture hasn’t really changed at all.", "It's generally devoted to glossy, bittersweet electronic drifts that are too slow, too long, or too bland."
};

String randomArray(String[] arr) {
  //TODO: remove from array once it's selected
  return arr[(int)random(arr.length)];
}

// words

String decade() {
  return randomArray(decades);
}

String oldBand() {
  return randomArray(oldBands);
}

String pretention() {
  return randomArray(pretentious_words); 
}

String modifier() {
  if(random(2.0) > 1.7) {
    return randomArray(modifiers) + ", " + modifier();
  }
  return randomArray(modifiers); 
}

String noun() {
  return randomArray(nouns);
}

String p4k() {
  return randomArray(p4k); 
}

// phrases

String oldBandComparison() {
  return "Similar, but not quite identical to the " + pretention() + " of " + decade() + "-era " + oldBand() + " and " + decade() + "-era " + oldBand();
}

String previousEffort() {
  return "their previous effort feels " + modifier() + " in comparison."; 
}

String firstHalf() {
  return "The first half of the album is a " + modifier() + " " + noun() + ", while"; 
}

String secondHalf() {
  return "the second half is more of a " + modifier() + " " + noun() + "."; 
}

String theDoors() {
  return "You can interpret this as another surreal metaphor in his search for enchanted love or chalk it up to a teenaged fixation with the Doors."; 
}

String finalString() {
  String finalString = oldBandComparison() + ", " + previousEffort() + " " + firstHalf() + " " + secondHalf() + " ";
  if(random(2.0) > 1.7) { finalString += theDoors(); }
  if(random(2.0) > 1.0) { finalString += p4k(); }
  return finalString + "\n\n";
}

void draw() {
  int firstA;
  String substr1;
  String substr2;
  String toPrint;
  for(int i = 0; i < 10; i++) {
    Boolean done = false;
    toPrint = finalString();
    // replaces a with an in relevant cases
    while(!done) {
      done = true;
      firstA = toPrint.indexOf(" a ");
      if((toPrint.charAt(firstA+3) == 'a') || (toPrint.charAt(firstA+3) == 'e') || (toPrint.charAt(firstA+3) == 'i') || (toPrint.charAt(firstA+3) == 'o') || (toPrint.charAt(firstA+3) == 'u')) {
        substr1 = toPrint.substring(0, firstA);
        substr2 = toPrint.substring(firstA+3, toPrint.length());
        toPrint = substr1 + " an " + substr2;
        done = false;
      }
    }
    // prints to text area
    screen_text.append(toPrint);
  }
}

