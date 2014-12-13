// heretic - a pretentious music review generator
// by Ben Bailey, bennettbailey@gmail.com 2014
// various phrases from pitchfork.com
// TextArea code from Lee Spector

import java.awt.TextArea; 

TextArea screen_text;

void setup() {
  size(600, 500);
  background(255);
  screen_text = new TextArea("", 30, 55, 1); 
  this.add(screen_text);
  noLoop();
}

// word banks
// use ArrayLists instead of Arrays because Java doesn't have a remove method for Arrays
ArrayList<String> oldBands = new ArrayList<String>() {{ add("Sonic Youth"); add("Swans"); add("King Crimson"); add("Arcade Fire"); add("Aphex Twin"); add("Radiohead"); add("Morrissey");}};
ArrayList<String> decades = new ArrayList<String>() {{ add("00s"); add("10s"); add("60s"); add("70s"); add("80s"); add("90s");}};
ArrayList<String> pretentious_words = new ArrayList<String>() {{add("juxtaposition"); add("dichotomy"); add("dissonance"); add("polarity"); add("contrast");}};
ArrayList<String> modifiers = new ArrayList<String>() {{add("quietly ambitious"); add("sophomoric"); add("warped"); add("decisively analog"); add("cliche"); add("trite"); add("intimate"); add("idiosyncratic"); add("effortless"); add("cerebral"); add("anxious"); add("axiomatic"); add("fecund"); add("protean"); add("obstreperous"); add("quiescent"); add("feckless"); add("soporific");}};
ArrayList<String> nouns = new ArrayList<String>() {{add("romp"); add("journey"); add("meditation"); add("concept"); add("pilgrimage"); add("odyssey"); add("voyage"); add("quest");}};
ArrayList<String> p4k = new ArrayList<String>() {{add("The whole record crackles with electricity."); add("Though the music might sound pricier than ever, the basic architecture hasn’t really changed at all."); add("It's generally devoted to glossy, bittersweet electronic drifts that are too slow, too long, or too bland."); add("You can interpret this as another surreal metaphor in his search for enchanted love or chalk it up to a teenaged fixation with the Doors."); add("The intended arc from invitation toward aggression occssionally scans more as zigs and zags between a few distinct suites"); add("Only two songs on the album don't quite fit the mold."); add("It’s a confident album precisely because it’s not self-consciously pushing the envelope.");
                                                  add("Many of their songs are meticulously crafted, but they also breathe and break with crackling spontaneity."); add("There's tension in this music between vulnerability and defenses, between the things we tell each other and the things we feel the need to keep hidden."); add("When punk stares into the abyss, this is what stares back."); add("For this band, growing up has not meant cooling the flames so much as beckoning them higher."); }};

// the general method to get a random element from an array(list) of strings and remove the element it returns
String randomArray(ArrayList<String> arr) {
  ArrayList<String> arrcopy = arr;
  int index = (int)random(arr.size()-1);
  arr.remove(index);
  return arrcopy.get(index);
}

// words - methods to retrieve words from the arrays of words

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
  // occasionally generate multiple modifiers
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

// phrases - methods that string together phrases from the individual words

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

// the final method that creates the full review
// sometimes it produces one structure, sometimes it produces a different one

String finalString() {
  String finalString = "";
  if(random(3.0) > 2.0) { finalString = oldBandComparison() + ", " + previousEffort() + " " + firstHalf() + " " + secondHalf() + " " + p4k(); }
  else if(random(3.0) > 1.0) { finalString = p4k() + " " + oldBandComparison() + ", " + previousEffort() + " " + firstHalf() + " " + secondHalf() + " " + p4k(); }
  else { finalString = firstHalf() + " " + secondHalf() + " " + oldBandComparison() + ", " + previousEffort() + " " + p4k(); }
  return finalString + "\n\n";
}

void draw() {
  int firstA;
  String substr1;
  String substr2;
  String toPrint;
  // create multiple iterations of reviews
  for(int i = 0; i < 100; i++) {
    Boolean done = false;
    toPrint = finalString();
    // replaces a with an in relevant cases
    while(!done) {
      done = true;
      println(toPrint);
      firstA = toPrint.indexOf(" a ");
      if(firstA != -1) { //catch to see if there is no occurrence of " a " in the string
        if((toPrint.charAt(firstA+3) == 'a') || (toPrint.charAt(firstA+3) == 'e') || (toPrint.charAt(firstA+3) == 'i') || (toPrint.charAt(firstA+3) == 'o') || (toPrint.charAt(firstA+3) == 'u')) {
          substr1 = toPrint.substring(0, firstA);
          println(substr1);
          substr2 = toPrint.substring(firstA+3, toPrint.length());
          toPrint = substr1 + " an " + substr2;
          done = false;
        }
      }
    }
    // prints to text area
    screen_text.append(toPrint);
    oldBands = new ArrayList<String>() {{ add("Sonic Youth"); add("Swans"); add("King Crimson"); add("Arcade Fire"); add("Aphex Twin"); add("Radiohead"); add("Morrissey");}};
    decades = new ArrayList<String>() {{ add("00s"); add("10s"); add("60s"); add("70s"); add("80s"); add("90s");}};
    pretentious_words = new ArrayList<String>() {{add("juxtaposition"); add("dichotomy"); add("dissonance"); add("polarity"); add("contrast");}};
    modifiers = new ArrayList<String>() {{add("quietly ambitious"); add("sophomoric"); add("warped"); add("decisively analog"); add("cliche"); add("trite"); add("intimate"); add("idiosyncratic"); add("effortless"); add("cerebral"); add("anxious"); add("axiomatic"); add("fecund"); add("protean"); add("obstreperous"); add("quiescent"); add("feckless"); add("soporific");}};
    nouns = new ArrayList<String>() {{add("romp"); add("journey"); add("meditation"); add("concept"); add("pilgrimage"); add("odyssey"); add("voyage"); add("quest");}};
    p4k = new ArrayList<String>() {{add("The whole record crackles with electricity."); add("Though the music might sound pricier than ever, the basic architecture hasn’t really changed at all."); add("It's generally devoted to glossy, bittersweet electronic drifts that are too slow, too long, or too bland."); add("You can interpret this as another surreal metaphor in his search for enchanted love or chalk it up to a teenaged fixation with the Doors."); add("The intended arc from invitation toward aggression occssionally scans more as zigs and zags between a few distinct suites"); add("Only two songs on the album don't quite fit the mold."); add("It’s a confident album precisely because it’s not self-consciously pushing the envelope.");
                                    add("Many of their songs are meticulously crafted, but they also breathe and break with crackling spontaneity."); add("There's tension in this music between vulnerability and defenses, between the things we tell each other and the things we feel the need to keep hidden."); add("When punk stares into the abyss, this is what stares back."); add("For this band, growing up has not meant cooling the flames so much as beckoning them higher."); }};  }
}

