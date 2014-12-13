/* assigned memory: x[0-5] are ATTRIBUTES; things that can be determined by ask(). 
 
 The attributes are: 
 
 0 shrinking violet/gregarious; 
 1 meek/grandiloqent; 
 2 superstitious/evil; 
 3 repugnant/alluring; 
 4 conciliatory/pugnacious; 
 5 stupid/erudite
 
 it is not possible to be two opposite attributes at once
 x[6] is an id number, used to remember which character was selected by ask() and to locate
 the appropriate disposition block. Sometimes this is also used for switch/case to select a 
 particular character
 x[7-22] is the disposition block. Four dispositions are stored towards each character
 a character will not store dispositions towards himself, but still has this block for
 the sake of easily "translating" dispositions into text
 
 currently the dispositions are:
 
 love/hate:
 
 1 means "comfortable"
 2 means "friends"
 3 means "annoyance"
 4 means "dislike"
 5 mean "hatred"
 6 means "mortal hatred"
 7 means "love"
 8 means "relaxed" (similar to "comfortable", but indicates that a character has overcome fear or dislike)
 
 fear:
 1 means "uncomfortable"
 2 means "nervous"
 3 means "terrified"
 
 evil:
 1-3 are stages of evil plannning, 
 4 means a superstitious character is on to the evil character
 
 I have yet to assign a fourth dispostion. 
 
 finally, special conditions:
 
 x[23] is strength. A character's strength can be modified by their class or special events.
 If two characters get into a fight and have different strengths, the stronger will automatically
 wound the other and the fight will not be randomly decided. 
 
 x[24] IS a 'wounded' condition that is usually the resut of a fight; will cause a character
 to slowly  die unless they are healed by a friendly erudite character, or player action
 
 x[25] will probably be special "abject" status that can be triggered by love,
 leads to depression --> drinking --> loss of 'alluring' and 'erudite' attributes
 --> alcoholic anonymous --> "mature" status (x[25] = 2) that prevents this from happening again
 
 x[26] is illness. Sick characters have a small chance each turn of either getting well (1/5) or
 becoming terminal (1/10), in which case they will be considered 'wounded' and need to be healed
 
 x[27] means that a character has a PROFESSION. Professions are assigned to the first character
 to have a specific combination of attributes. When a character is assigned a profession, they 
 will at first avoid social interaction and go through a three part storylet. x[27] = 1-3 means that
 the character is learning their profession. When they finish their story new attributes will be 
 assigned to the character based on their profession. x[27] = 4 means that a character has completed
 their storylet.
 
 x[28] contains the id of the character's profession. There are 12 professions. x[27] and x[28] can be
 used together to determine the location of the string that should be printed as a character advances 
 through their profession storylet.
 
 x[29] is wealth. Wealth can substitute for good qualities in matters of love. Many professions revolve
 around gaining or losing wealth.
 
 x[30] indicates that a character is a werewolf. Self-explanatory imo
 
 
 */

class Character {
  int[] x;
  String[] y = new String [6];
  String[] z = new String [16];
  String name;

  Character(int[] tempX, String Tempname, int tempid) {
    x = tempX;
    name = Tempname;
    x[6] = tempid;
  }

  /* this inelegant little program updates each character's array of strings to reflect data they
   have been assigned, usually through "ask()" or "interact(character)". The strings are useful 
   to store so that a statement like "the cowman was grandiloquent" can be printed without doing
   the math to calculate what "cowman.x[1] == 2" means every single time. The strange math here is
   due to more than one value existing for each attribute/dispostion; by default, everything here
   will assign to every part of the array a null string that marks the beginning of a set of 
   value (for instance, Attributes[9] == null, so that nothing will be assigned until x[3] is 
   equal to 1 or 2. The "repugnant" and "alluring" strings live at Attributes[10] and [11]
   respectively, and will be assigned because 9+1 = 10 and 9+2 = 11 */

  void update() {
    y[0] = Attributes [x[0]];
    y[1] = Attributes [x[1]+3];
    y[2] = Attributes [x[2]+6];
    y[3] = Attributes [x[3]+9];
    y[4] = Attributes [x[4]+12];
    y[5] = Attributes [x[5]+15];
    z[0] = Dispositions [x[7]];
    z[1] = Dispositions [x[8]+9];
    z[4] = Dispositions [x[11]];
    z[5] = Dispositions [x[12]+9];
    z[8] = Dispositions [x[15]];
    z[9] = Dispositions [x[16]+9];
    z[13] = Dispositions [x[19]];
    z[14] = Dispositions [x[20]+9];
  }

  /* simple 'for' loop used to apply the correct adjectives to the correct 
   characters, when characters are introduced with 'characterinfo' active.
   The actual assignment of memory space to characters occurs in introduce() */

  void checkdis (int x, int y, Character q) {
    for (int j = x; j < y; j++) {
      if (z[j] == null) {
      } else {
        textln (name + " felt " + z[j] + " with " + q.name + ".");
      }
    }
  }


  /* when characterinfo is turned off, simply announces that a character is
   in the scene. When characterinfo is turned on, also prints all of that
   character's attributes, dispositions, and special conditions. Here, also, 
   if a character is sick, they have a chance of getting better or worse. */

  void introduce() {
    textln (name + " was there.");
    if (x[26] == 1) {
      int whitebloodcells = int (random(10));
      if (whitebloodcells < 2) {
        textln (name + " had a coughing fit. " + name + " was still sick!");
      } else if (whitebloodcells < 3) {
        textln (name + " was feeling terrific that day. " + name + " wasn't sick anymore!");
        x[26] = 0;
      } else if (whitebloodcells < 4) {
        textln (name + " looked terrible!! His illness had become grave! It wasnt clear if he was going to make it!!");
        textln (name + " is now WOUNDED");
        x[26] = 0;
        x[24] = 1;
      }
    }
    if (characterinfo == 1) {
      if (x[27] > 0) { // if the character has a profession, print the name of the profession
        textln (name + " was a " + Professions[x[28]]);
      }
      for (int i = 0; i < 6; i++) { //print all assigned attributes
        if (y[i] == null) {
        } else {
          textln (name + " was " + y[i] + ".");
        }
      }
      if (x[23] > 0 ) { //if the character has any strength, print that value
        textln (name + "'s STRENGTH was " + x[23]);
      }
      if (x[24] > 0 ) { //if a character is wounded, say so
        textln (name + " was HURT.");
      }
      if ((x[25] > 0) && (x[25] < 4)) { //if a character is abject, say so
        textln (name + " was DEPRESSED.");
      }      
      if (x[26] == 1) { //if a character is sick, say so
        textln (name + " was SICK.");
      }
      if (x[29] == 1) { // wealthy
        textln (name + " possesed WEALTH");
      }
      if (x[30] == 1) { //if werewolf
        textln (name + " was A WEREWOLF");
      }
      if (scene == 4) {
      } else { 
        checkdis (0, 4, cowman);
      }
      if (scene == 3) {
      } else {
        checkdis (4, 8, gendarme);
      }
      if (scene == 2) {
      } else {
        checkdis (8, 12, tradesman);
      }
      if (scene == 1) {
      } else {
        checkdis (12, 16, indian);
      }
      textln (" ");
    }
  }

  /* 'characterinfo'--prints the same information as a character's introduction, for all characters.
   A potential substitute for enabling informataion */

  void characterinfo() {
    if (x[27] > 0) { // if the character has a profession, print the name of the profession
      textln (name + " was a " + Professions[x[28]]);
    }
    for (int i = 0; i < 6; i++) { //print all assigned attributes
      if (y[i] == null) {
      } else {
        textln (name + " was " + y[i] + ".");
      }
    }
    if (x[23] > 0 ) { //if the character has any strength, print that value
      textln (name + "'s STRENGTH was " + x[23]);
    }
    if (x[24] > 0 ) { //if a character is wounded, say so
      textln (name + " was HURT.");
    }
    if ((x[25] > 0) && (x[25] < 4)) { //if a character is abject, say so
      textln (name + " was DEPRESSED.");
    }      
    if (x[26] == 1) { //if a character is sick, say so
      textln (name + " was SICK.");
    }
    if (x[29] == 1) { // wealthy
      textln (name + " possesed WEALTH");
    }
    if (x[30] == 1) { //if werewolf
      textln (name + " was A WEREWOLF");
    }
    checkdis (0, 4, cowman);
    checkdis (4, 8, gendarme);
    checkdis (8, 12, tradesman);
    checkdis (12, 16, indian);
    textln (" ");
  }

  void ask() {
    /* here the first random number determines what attribute should be asked about, and the second random number determines whether the negative or positive
     aspect should be asked about. See the top of this tab for what the attributes are. This wil loop until an unassigned attribute is selected; the initial
     if statement excludes situations in which all six attributes have already been determined, which would othewise cause an endless loop */

    if ((x[0] == 0) || (x[1] == 0) || (x[2] == 0) || (x[3] == 0) || (x[4] == 0) || (x[5] == 0)) {
      int at = int (random (6));
      if (x[at] == 0) {
        int i = int(random(2));

        if (i == 0 ) {
          textln("was " + name + " " + Attributes[(3*at)+1] +"? (y/n)");
          attinquestion = at;
          whichattinq = 1;
          whatchar = x[6];
        } else {
          textln("was " + name + " " + Attributes[(3*at)+2] +"? (y/n)");
          attinquestion = at;
          whichattinq = 2;
          whatchar = x[6];
        }
        keyneed = 2;
      } else
        ask ();
    } else {

      textln ("press ENTER to continue");
      textln (" ");
      textln (" ");
      keyneed = 1;
    }
  }

  /* after a character gains a new attribute, CheckProfession should alawys be run to determine whether 1) the character already
   has a profession and 2) if they do not, whether the attribute they have just been assigned should cause them to gain a profession
   as well. Also prints flavor text based on the profession
   note: when a profession is assigned, character ids are stored so that a specific character can be located by profession if needed, 
   such as when the jock tries to beat up the nerd. They are stored a x[6]+1 so that the cowman, whose id is zero, will not 
   mistakenly record an unassigned profession. When using the number recorded in isittaken[] to id a character, you must use 
   isittaken[profession#] - 1 to get the correct id */

  void CheckProfession() { 
    if (x[27] == 0) {
      if ((x[2] == 2) && (x[5] == 2) && (isittaken[0] == 0)) { // evil + erudite = mad scientist
        x[27] = 1;
        x[28] = 0;
        isittaken[0] = x[6]+1;
        textln (name + " had become both EDUCATED and EVIL! " + name + " used his knowledge of SCIENCE to pursue his interest in EVIL!!");
        textln (name + " now had a profession: MAD SCIENTIST");
        textln (" ");
      } else if  ((x[2] == 1) && (x[5] == 2) && (isittaken[1] == 0)) { // superstitious + erudite = wizard
        x[27] = 1;
        x[28] = 1;
        isittaken[1] = x[6]+1;
        textln (name + " had become both SUPERSTITIOUS and LEARNED! " + name + " applied his INTELLECT to matters OCCULT, ARCANE, and FORBIDDEN!!");
        textln (name + " now had a profession: WIZARD");
        textln (" ");
      } else if ((x[5] == 1) && (x[4] == 2) && (isittaken[2]== 0)) { // stupid + pugnacious = fighter
        x[27] = 1;
        x[28] = 2;
        isittaken[2] = x[6]+1;
        textln (name + " was NONE TOO BRIGHT, but liked to have a good TUMBLE now and then! " + name + " brought his IDIOT STRENGTH to all matters PUGILISTIC!!");
        textln (name + " now had a profession: FIGHTER");
        textln (" ");
      } else if ((x[0] == 2) && (x[3] == 1) && (isittaken[3] == 0)) { // repugnant + gregarious = sideshow freak
        x[27] = 1;
        x[28] = 3;
        isittaken[3] = x[6]+1;
        textln (name + " was OUTWARDLY HIDEOUS, but had established a WINNING PERSONALITY! " + name + " decided to BRAND and MARKET his DISGUSTING COUNTENANCE!!");
        textln (name + " now had a profession: SIDESHOW FREAK");
        textln (" ");
      } else if ((x[3] == 1) && (x[5] == 2) && (isittaken[4] == 0)) { // repugnant + erudite = writer
        x[27] = 1;
        x[28] = 4;
        isittaken[4] = x[6]+1;
        textln (name + " was a WEIRD SOCIAL OUTCAST who had become HIGHLY EDUCATED! " + name + " decided to use his ENGLISH MAJOR to express his DUMB FEELINGS in a way that few people would CARE TO RELATE TO!!");
        textln (name + " now had a profession: MODERATELY ACCLAIMED WRITER");
        textln (" ");
      } else if ((x[1] == 2) && (x[2] == 2) && (isittaken[5] == 0)) { // grandiloquent + evil = politician
        x[27] = 1;
        x[28] = 5;
        isittaken[5] = x[6]+1;
        textln (name + " had become both EVIL and TALENTED AT CASUISTRY! " + name + " used his proclivity for RODOMONTADE to advance his own interests!!");
        textln (name + " now had a profession: POLITICIAN");
        textln (" ");
      } else if ((x[0] == 1) && (x[5] == 2) && (isittaken[6] == 0)) { // shrinking violet + erudite = huge nerd
        x[27] = 1;
        x[28] = 6;
        isittaken[6] = x[6]+1;
        textln (name + " was afflicted by CRIPPLING SOCIAL ANXIETY and also KNEW A LOT OF STUFF! " + name + " completely failed to use his KNOWLEDGE to relate to other people!!");
        textln (name + " now had a profession: HUGE NERD");
        textln (" ");
      } else if ((x[1] == 1) && (x[4] == 2) && (isittaken[7] == 0)) { // alluring + meek = heart-throb
        x[27] = 1;
        x[28] = 7;
        isittaken[7] = 1;
        textln (name + " had become very ATTRACTIVE but remained COY and MODEST! " + name + " became all the more APPEALING through his GENTLE SELF-EFFACEMENT!!");
        textln (name + " now had a profession: TOTAL HEART-THROB");
        textln (" ");
      } else if ((x[1] == 1) && (x[2] == 2) && (isittaken[8] == 0)) { // evil + meek = thief (yes I know this is kind of a stretch)
        x[27] = 1;
        x[28] = 8;
        isittaken[8] = x[6]+1;
        textln (name + " was both EVIL and SUBTLE! " + name + " decided to use his INCONSPICUOUSNESS to his advantage in his UNLAWFUL undertakings!!");
        textln (name + " now had a profession: THIEF");
        textln (" ");
      } else if ((x[0] == 2) && (x[4] == 2) && (isittaken[9] == 0)) { // pugnacious + gregarious = jock
        x[27] = 1;
        x[28] = 9;
        isittaken[9] = x[6]+1;
        textln (name + " had become both SOCIABLE and ROWDY! " + name + " channeled his COMPETITIVE ENERGY into friendly contests of PHYSICAL SKILL!!");
        textln (name + " now had a profession: JOCK");
        textln (" ");
      } else if ((x[4] == 1) && (x[0] == 2) && (isittaken[10] == 0)) { // gregarious + conciliatory = doctor. Why not conciliatory + erudite?? I don't know! I've just already overused erudite!
        x[27] = 1;
        x[28] = 10;
        isittaken[10] = x[6]+1;
        textln (name + " had acquired a sincere INTEREST IN OTHER PEOPLE, as well as a marked DISTASTE FOR HUMAN SUFFERING! " + name + " decided to spend his life HELPING PEOPLE!!");
        textln (name + " now had a profession: DOCTOR");
        textln (" ");
      } else if ((x[2] == 1) && (x[1] == 1)) { // grandiloquent + superstitious = preacher
        x[27] = 1;
        x[28] = 11;
        isittaken[11] = x[6]+1;
        textln (name + " had become SUPERSTITIOUS and also acquired an INFLATED SENSE OF HIS OWN IMPORTANCE! " + name + " used his BIG PUFFED-UP TALK to discuss MATTERS OF FAITH AND THE HEART!!");
        textln (name + " now had a profession: PREACHER MAN");
        textln (" ");
      }
    }
  }


  void converse(Character target) {

    /* this causes one character to talk to another. At the very least a line will 
     be printed indicating that a conversation occured. If the right conditions are 
     met certain things will happen to modify character dispositions; this will 
     produce new effects in future interactions. Only one special result should occur
     at a time; which one activates is determined by a hierarchy organized according
     to how advanced a disposition is and whether it 'make sense' to ignore other
     possible interactions. For instance, anxiety takes precedence over characters
     becoming acquainted, but not falling in love */

    /* "whothis" and "whothat" are used to locate the FIRST DISPOSITION of the 
     first character (name) toward the second and the FIRST DISPOSITION of the 
     second character (target.name) for the first. Whothat should ALWAYS be used 
     to modify character 1's disposition towards character 2, and vice versa.
     Since this only refers to the first disposition it must be modified when
     like/dislike is not the desired disposition; for instance, fear dispostions
     must write to whothis+1 and whothat+1 */

    int whothis = (x[6]) * 4 + 7;
    int whothat = (target.x[6]) * 4 + 7;
    int specialinteraction = int(random(10));

    /* wounded characters. Wounded characters do not get to interact, unless they meet a 
     friendly (x[whothat] = 2) erudite character, who will heal them. If the player has
     practiced first aid they will also be able to try to heal the character, with a success
     rate determined by their skill (1-3). Finally, if there is a doctor character in the game,
     and they have built a hospital, the character will automatically be cured. */

    if (x[24] > 0) {
      if (isthereahospital == 1) {
        textln (name + " went to the hospital. The doctor on call shook her head. 'when will the people in this village learn...' she said, under her breath, suturing " + name + "'s wounds shut. He lived to fight another day.");
        x[24] = 0;
      } else if ((target.x[whothis] == 2) && (target.x[5] == 2)) {
        textln (target.name + " discovered his friend " + name + " lying on the ground, where the fight had ended. Oh no! He couldn't let this happen to his chum!! Luckily, " + target.name + " had learned first aid as a child while waiting for the other kids to finish a math test! He put his skills to work in a few hours " + name + " was right as rain!!");
        x[24] = 0;
      } else {
        x[24]++;
        textln (name + "'s condition worsened!");
        if (x[24] == 2) {
          textln (name + " was on the verge of death! Knock knock knockin' on heaven's door!");
        } else if (x[24] == 3) {
          textln ("...");
          textln ("oh god.");
          textln (" ");
          textln (name + " has died.");
          textln ("he's dead.");
          textln (" ");
          textln ("THE END");
          textln (" ");
          textln ("thanks for playing!");
          keyneed = 10;
          storyover = 1;
        }
      }
      specialevent = 1;
    } else if (target.x[24] > 0) {
      if (isthereahospital == 1) {
        textln (target.name + " went to the hospital. The doctor on call shook her head. 'when will the people in this village learn...' she said, under her breath, suturing " + target.name + "'s wounds shut. He lived to fight another day.");
        target.x[24] = 0;
      } else if ((x[whothat] == 2) && (x[5] == 2)) {
        textln (name + " discovered his friend " + target.name + " lying on the ground, where the fight had ended. Oh no! He couldn't let this happen to his chum!! Luckily, " + name + " had learned first aid as a child, while waiting for the other kids to finish a math test! He put his skills to work in a few hours " + target.name + " was right as rain!!");
        target.x[24] = 0;
      } else {
        target.x[24]++;
        textln (target.name + "'s condition worsened!");
        if (target.x[24] == 3) {
          textln (target.name + " was on the verge of death! Knock knock knockin' on heaven's door!");
        } else if (target.x[24] == 4) {
          textln ("...");
          textln ("oh god.");
          textln (" ");
          textln (target.name + " has died.");
          textln ("he's dead.");
          textln (" ");
          textln ("THE END");
          textln (" ");
          textln ("thanks for playing!");
          keyneed = 10;
          storyover = 1;
        }
      }
      specialevent = 1;
    }

    /* depression. Depression is a special event that will prevent a character from interacting. The character
     must go through three stages to be cured of depression. During the second stage they have a 1/5 chance of 
     becoming sick. */

    else if ((x[25] > 0) && (x[25] < 4)) {
      textln (name + DepressionEvents[x[25]]);
      x[25]++; 
      if (x[25] == 2) {
        int livercapacity = int (random(5));
        if (livercapacity == 0) {
          textln (name + " was really not taking taking care of himself at all! " + name + " became sick!");
          x[26] = 1;
        }
      }
    } else if ((target.x[25] > 0) && (target.x[25] < 4)) {
      textln (DepressionEvents[target.x[25]]);
      target.x[25]++;
      if (target.x[25] == 2) {
        int livercapacity = int (random(5));
        if (livercapacity == 0) {
          textln (target.name + " was really not taking taking care of himself at all! " + target.name + " became sick!");
          target.x[26] = 1;
        }
      }
    }

    /* profession storylets. Wow this is a big one! Each profession takes three turns to play out. Characters won't 
     interact while going through storylets. To prevent storylets from occuring twice in one
     round they are considered to be 'special events' */

    else if ((x[27] > 0) && (x[27] < 4)) {
      textln (name + ProfessionStories[4*(x[28])+x[27]]);
      if (x[27] == 3) {
        switch (x[28]) {
        case 0:
          if (target.x[29] == 1) {
            textln (target.x + " surrendered his wealth! " + name + " was pacified! Nothing was blown up!!");
            x[29] = 1;
          } else { 
            textln (name + ProfessionStories[4]);
            x[23] += 100;
            isthereahospital = 0;
          } 
          break;
        case 1:
          textln (name + ProfessionStories[8]);
          x[23] += 200;
          break;
        case 2:
          textln (name + ProfessionStories[12]);
          x[29] = 1;
          x[23] += 10;
          break;
        case 3:
          textln (name + ProfessionStories[16]);
          x[3] = 2;
          break;
        case 4:
          textln (name + ProfessionStories[20]);
          cowman.x[25] = 1;
          tradesman.x[25] = 1;
          gendarme.x[25] = 1;
          indian.x[25] = 1;
          x[29] = 1;
          break;
        case 5:
          textln (name + ProfessionStories[24]);
          x[3] = 1;
          x[29] = 1;
          cowman.x[26] = 1;
          tradesman.x[26] = 1;
          gendarme.x[26] = 1;
          indian.x[26] = 1;
          break;
        case 6:
          textln (name + ProfessionStories[28]);
          x[29] = 1;
          x[3] = 1;
          break;
        case 7:
          textln (ProfessionStories[32]);
          break;
        case 8:
          textln (ProfessionStories[36]);
          cowman.x[29] = 0;
          tradesman.x[29] = 0;
          gendarme.x[29] = 0;
          indian.x[29] = 0;
          x[29] = 1;
          break;
        case 9:
          x[23] += 3;
          if (isittaken[6] > 0) {      
            x[(isittaken[6] - 1) * 4 + 9] = 3; //this is the disposition that causes evil characters to attack whoever they have been plotting against. Used for convenience to get this character to beat up the nerd, if any, next time they meet 
            textln (" he had located his Nerd. His eyes narrowed.");
          } else {
            textln (name + ProfessionStories[40]);
            x[4] = 1;
          }
          break;
        case 10:
          textln (name + ProfessionStories[44]);
          isthereahospital = 1;
          break;
        case 11:
          textln (name + ProfessionStories[48]);
          if (cowman.x[2] == 0) {
            cowman.x[2] = 1;
          }
          if (tradesman.x[2] == 0) {
            cowman.x[2] = 1;
          }
          if (gendarme.x[2] == 0) {
            cowman.x[2] = 1;
          }
          if (indian.x[2] == 0) {
            cowman.x[2] = 1;
          }
        }
      }
      specialevent = 1;
      x[27]++;
    } else if ((target.x[27] > 0) && (target.x[27] < 4)) {
      textln (target.name + ProfessionStories[4*(target.x[28])+target.x[27]]);
      if (target.x[27] == 3) {
        switch (target.x[28]) {
        case 0:
          if (x[29] == 1) {
            textln (x + " surrendered his wealth! " + target.name + " was pacified! Nothing was blown up!!");
            target.x[29] = 1;
          } else { 
            textln (target.name + ProfessionStories[4]);
            target.x[23] += 100;
            isthereahospital = 0;
          } 
          break;
        case 1:
          textln (target.name + ProfessionStories[8]);
          target.x[23] += 200;
          break;
        case 2:
          textln (target.name + ProfessionStories[12]);
          target.x[29] = 1;
          target.x[23] += 10;
          break;
        case 3:
          textln (target.name + ProfessionStories[16]);
          target.x[3] = 2;
          break;
        case 4:
          textln (target.name + ProfessionStories[20]);
          cowman.x[25] = 1;
          tradesman.x[25] = 1;
          gendarme.x[25] = 1;
          indian.x[25] = 1;
          target.x[29] = 1;
          break;
        case 5:
          textln (target.name + ProfessionStories[24]);
          target.x[3] = 1;
          target.x[29] = 1;
          cowman.x[26] = 1;
          tradesman.x[26] = 1;
          gendarme.x[26] = 1;
          indian.x[26] = 1;
          break;
        case 6:
          textln (target.name + ProfessionStories[28]);
          target.x[29] = 1;
          target.x[3] = 1;
          break;
        case 7:
          textln (ProfessionStories[32]);
          break;
        case 8:
          textln (ProfessionStories[36]);
          cowman.x[29] = 0;
          tradesman.x[29] = 0;
          gendarme.x[29] = 0;
          indian.x[29] = 0;
          target.x[29] = 1;
          break;
        case 9:
          target.x[23] += 3;
          if (isittaken[6] > 0) {      
            target.x[(isittaken[6] - 1) * 4 + 9] = 3; //this is the disposition that causes evil characters to attack whoever they have been plotting against. Used for convenience to get this character to beat up the nerd, if any, next time they meet 
            textln ("He had located his Nerd. His eyes narrowed.");
          } else {
            textln (target.name + ProfessionStories[40]);
            target.x[4] = 1;
          }
          break;
        case 10:
          textln (target.name + ProfessionStories[44]);
          isthereahospital = 1;
          break;
        case 11:
          textln (target.name + ProfessionStories[48]);
          if (cowman.x[2] == 0) {
            cowman.x[2] = 1;
          }
          if (tradesman.x[2] == 0) {
            cowman.x[2] = 1;
          }
          if (gendarme.x[2] == 0) {
            cowman.x[2] = 1;
          }
          if (indian.x[2] == 0) {
            cowman.x[2] = 1;
          }
        }
      }
      specialevent = 1;
      target.x[27]++;
    }



    /* fights! Fights occur when two characters interact after both reaching the "mortal 
     hatred" disposition towards each other. They will also happen when evil characters have
     finished preparing to murder somebody. The most likely outcome of a fight is for 
     at least one character to be wounded, but it is also possible (3/10) for neither to be 
     hurt. There is also a small chance (1/10) of a character being killed; note that this
     will END THE STORY!! if the program is working correctly. If one character has gained
     more strength than the other that character will automatically win the fight (wounding
     the other). After a fight both characters will reset their love/hate dispositions to 0.
     Very high priority. */

    else if (((x[whothat] == 6) && (target.x[whothis] == 6)) || (x[whothat +2] > 2) || (target.x[whothis+2] > 2)) {
      textln (name + " and " + target.name + " got in a fight! Holy shit!");
      if (x[whothat + 2] == 4) { //strength bonus for supersitious characters warding off evil
        x[23] = x[23] + 20;
      }
      if (target.x[whothis+2] == 4) {
        target.x[23] = target.x[23] + 20;
      }
      if (x[23] > target.x[23]) {
        textln (name + " overcame " + target.name + " with his superior STRENGTH! " + target.name + " was hurt real bad and needed a doctor now!");
        target.x[24] = 1;
      } else if (target.x[23] > x[23]) {
        textln ("The exceedingly STRONG " + target.name + " overpowered " + name + "! " + target.name + " was wounded!");
        x[24] = 1;
      } else {
        int whowins = int (random(10));
        if (whowins < 3) { //in this case nobody gets hurt. 3/10 chance
          textln ("...both emerged from the scuffle unscathed.");
        } else if (whowins < 5) { //in this case they both get hurt. 1/5 chance
          textln ("...they could barely be broken up. Both sustained serious injuries.");
          x[24] = 1;
          target.x[24] = 1;
        } else if (whowins < 7) { //in this case only "name" gets hurt. 1/5 chance
          textln ("..." + name + " was badly injured! He needed to go to a hospital!");
          x[24] = 1;
        } else if (whowins < 9) { //in this case only "target.name" gets hurt. 1/5 chance
          textln ("..." + target.name + " sustained serious injuries! He needed medical attention!!");
          target.x[24] = 1;
        } else if (whowins == 9) { //in this case somebody dies. :( This ends the story. 1/10 chance
          textln ("...");
          textln ("......");
          textln (name + " was killed in the fight.");
          textln ("...");
          textln ("THE END");
          textln (" ");
          textln ("thanks for playing!");
          keyneed = 10;
          storyover = 1;
        }
        if (x[whothat + 2] == 4) { //returning supersitious character's strength to original amount
          x[23] = x[23] - 20;
        }
        if (target.x[whothis+2] == 4) {
          target.x[23] = target.x[23] - 20;
        }
        x[whothat] = 0;
        target.x[whothis] = 0;
        if (whowins !=9) {
          textln (name + " and " + target.name + "'s anger subsided!");
        }
      }
    }

    /* EVIL! Evil characters plan to murder all other characters except for other evil characters.
     Evil characters will spend three turns "plotting against" the other characters, advancing the
     3rd disposition (superstitious/evil) by 1. Each time this happens, the evil character's strength
     increases by 1. Superstitous character will be able to identify evil characters after only one 
     turn (during which they have a 1/2 chance of making the characters no longer evil) and get a +20
     bonus when fighting evil characters */
    else if ((x[2] == 2) && (target.x[2] == 2)) {
      textln (name + " and " + target.name + " were both up to nefarious deeds, and left each other alone. 'Game recognize game', said " + name);
    } else if ((x[2] == 2) && (target.x[2] == 1)) {
      textln (target.name + " was on to " + name + "'s evil plans! " + target.name + " prepared a spell to ward away evil!");
      int doesitwork = int (random(2));
      if (doesitwork == 0) {
        textln ("The spell caused " + name + " to renounce his master, Satan! " + name + " was not evil anymore!");
        x[2] = 0;
        x[9] = 0; //resetting all evil/superstitious dispostions so that the no-longer evil character doesn't go ahead and kill someobody anyway
        x[13] = 0;
        x[17] = 0;
        x[21] = 0;
      } else {
        textln (target.name + " became magically powerful!");
        target.x[whothis+2] = 4;
      }
    } else if ((target.x[2] == 2) && (x[2] == 1)) {
      textln (name + " knew how to recognize evil, and " + target.name + " was evil! " + name + " performed a ritual to banish " + target.name + " to Hell!");
      int doesitwork = int (random(2));
      if (doesitwork == 0) {
        textln ("Well, it didn't exactly banish him to Hell, but he did seem to no longer be evil, which was definitely good.");
        target.x[2] = 0;
        target.x[9] = 0;
        target.x[13] = 0;
        target.x[17] = 0;
        target.x[21] = 0;
      } else {
        textln (target.name + " became magically powerful!");
        x[whothat+2] = 4;
      }
    } else if (x[whothat + 2] == 2) {
      x[whothat + 2] = 3;
      x[23]++;
      textln (name + "'s evil plan has nearly come to fruition!!" + target.name + " was in serious danger!!");
    } else if (x[whothat + 2] == 1) {
      x[whothat + 2] = 2;
      x[23]++;
      textln (name + " was still plotting against " + target.name + " and " + target.name + " didn't even know! He thought they were buds!!");
    } else if (x[2] == 2) {
      x[whothat + 2] = 1;
      x[23]++;
      textln (name + " talked to " + target.name + ". " + name + " began planning to murder " + target.name + ". He was crazy. Dead crazy.");
    } else if (target.x[whothis + 2] == 2) {
      target.x[whothis + 2] = 3;
      target.x[23]++;
      textln (target.name + "'s evil plan was now very close at hand!" + target.name + " was a marked man!!");
    } else if (target.x[whothis + 2] == 1) {
      target.x[whothis + 2] = 2;
      target.x[23]++;
      textln (target.name + " was still plotting against " + name + " and " + name + " didn't suspect a thing! Ruh-roh!");
    } else if (x[2] == 2) {
      x[whothat + 2] = 1;
      x[23]++;
      textln (name + " talked to " + target.name + ". " + name + " began planning to murder " + target.name + ". He was a stone-cold psychopath.");
    }

    /* special event interactions. A matter of pure chance. These all change a character's attributes in interesting ways */
    else if (specialinteraction == 0 ) {
      int whichspecial = int (random(7));
      textln (name + " was there. ");
      textln (SpecialInteractions[whichspecial]);
      textln (name+ SpecialInteractions[whichspecial+7]);
      switch (whichspecial) {
      case 0:
        x[23] += 1;
        break;
      case 1:
        x[25] = 1;
        break;
      case 2: 
        x[3] = 2;
        break;
      case 3:
        x[4] = 2;
        break;
      case 4:
        x[26] = 1;
        break;
      case 5:
        x[30] = 1;
        x[2] = 2;
        x[23] += 8;
        textln (name + " became EVIL and STRONG");
        break;
      case 6:
        int wholove = int(random(4));
        x[wholove * 4 + 7] = 7;
      }
    }



    /* final fear interaction. This only affects the character who initiates the conversation.
     This character will decide to 'reinvent themself', changing one attribute and then 
     resetting all fear dispositions to zero. This should make it impossible for all 
     characters to become trapped in fear forever, which is a plus in my opinion */

    else if (x[whothat+1] == 3) {
      textln (name + " was unable to speak to " + target.name + " due to fear. " + name + " was sick of this shit! " + name + " decided to reinvent himself!");
      textln (" ");
      int attr = int (random(6));
      if (x[attr] == 2) {
        x[attr] = 1;
        textln (name + " was now " + Attributes[3*attr + 1]);
      } else {
        x[attr] = 2;
        textln (name + " was now " + Attributes[3*attr + 2]);
      }
      x[8] = 0;
      x[12] = 0;
      x[16] = 0;
      x[20] = 0;
      textln (name + " was not afraid anymore!!");
    } else if (target.x[whothis+1] == 3) {
      textln (name + " talked to " + target.name + ".");
      textln (target.name + " was unable to speak to " + name + " due to fear. " + target.name + " was sick of this shit! " + target.name + " decided to reinvent himself!");
      textln (" ");
      int attr = int (random(6));
      if (target.x[attr] == 2) {
        target.x[attr] = 1;
        textln (target.name + " was now " + Attributes[3*attr + 1]);
      } else {
        x[attr] = 2;
        textln (target.name + " was now " + Attributes[3*attr + 2]);
      }
      target.x[8] = 0;
      target.x[12] = 0;
      target.x[16] = 0;
      target.x[20] = 0;
      textln (target.name + " was not afraid anymore!!");
    }



    /* love interactions. Lots going on here. Two characters that are 'together' are fairly
     boring and do not even get random storylets like characters who are friends do (unless
     I get bored at some point and add those). They will return the same flavor text and no 
     new disposition, with a small chance of the romance ending, either contentiously or 
     amicably. Repugnant characters have a 1/5 chance of these things happening. If love is
     NOT reciprocated then the character who is in love will be checked for the things that
     cause friendship to become love; if they have either attribute the love will become requited.
     If not the character who is in love will stop being 'in love' but will become depressed. 
     Depression is a special state like 'wounded' that has to play out on its own before the 
     character can interact again. I'd like to make it so that if the object of a character's 
     affection loves a DIFFERENT character then their suitor will hate that character. That
     would be very narratively interesting. But it would be difficult to implement and I will
     probably only do that if I finish with everything else I want to do */

    else if ((x[whothat] == 7) && (target.x[whothis] == 7)) {
      int whatislove = int (random(10));
      if ((whatislove == 0) || ((whatislove == 1) && ((x[3] == 1) || (target.x[3] == 1)))) { //so that repugnant characters have twice the odds
        textln (name + " and " + target.name + " didn't love each other anymore. The break up was amicable. Sometimes these things happen to adults.");
        x[whothat] = 2;
        target.x[whothis] = 2;
      } else if ((whatislove == 2) || ((whatislove == 3) && ((x[3] == 1) || (target.x[3] == 1)))) {
        textln (name + " and " + target.name + " had fallen out of love. A long time ago, probably. There was a big fight. Dazzling new insults were hurled. Then they stopped. There was a moment of silence; a lustful, codependent recrudescence seemed imminent. But then " + name + " walked out. They stayed broken up. And they stayed angry.");
        x [whothat] = 4;
        target.x [whothis] = 4;
      } else {
        textln (name + " and " + target.name + " were in love with each other, which was great, and all, but it was sort of weird to be around them in public now. You know how that goes.");
      }
    } else if (x[whothat] == 7) {
      if ((x[3] == 2) || (x[5] == 2) || (x[29] == 1)) {
        textln (name + " talked to " + target.name + ".");
        textln (name + " had butterflies in his stomach. He felt as if he were seeing " + target.name + " for the first time. '" + target.name + ",' he said. 'Do you...like me?' " + target.name + " smiled. Yes. He said yes.");
        target.x[whothis] = 7;
      } else {
        textln (name + " talked to " + target.name + ".");
        textln ("The conversation confirmed what " + name + " already knew. " + target.name + " did not love him.");
        if (x[25] == 0) {
          textln (name + " is now ABJECT.");
          x[25] = 1;
          x[whothat] = 0;
        } else {
          textln (name + " was a man of the world. He had been hurt before. He had learned to keep the hurt somewhere deep inside, where it would never be found");
          x[whothat] = 0;
        }
      }
    } else if (target.x[whothis] == 7) {
      if ((target.x[3] == 2) || (target.x[5] == 2) || (target.x[29] == 1)) {
        textln (target.name + " talked to " + name + ".");
        textln (target.name + " was in love with " + name + ". " + name + " fell in love with " + target.name + " too! Cool!!");
        x[whothat] = 7;
      } else {
        textln (name + " talked to " + target.name + ".");
        textln (target.name + " flirted as hard as he could. He flirted with of all his might; a great flirt was heard in the surrounding area. He flirted to no avail; " + name + " was unmoved by his flirtations.");
        if (target.x[25] == 0) {
          textln (target.name + " is now ABJECT.");
          target.x[25] = 1;
          target.x[whothis] = 0;
        } else {
          textln (target.name + " had flirted before. He would flirt again. He knew that failure was just another part of flirting. Already he was preparing himself for his next, great, flirt.");
          target.x[whothis] = 0;
        }
      }
    }




    /* hatred interactions. Mutual hatred immediately will immediately ascend to the point
     of 'mortal hatred', which will lead to a fight on the next interaction. If only one 
     character hates the other this will take three turns; neutral --> annoyed, annoyed -->
     hatred, and finally mutual hatred --> mutual mortal hatred. There is a chance (1/4) for
     the characters to reconcile. This is supposed to be only with conciliatory characters.
     However I messed up when coding it and made it apply only to PUGNACIOUS characters, i.e.
     most characters who get in conflicts in the first place. I like it more this way. */

    else if ((x[whothat] == 5) && (target.x[whothis] == 5)) {
      textln (name + " talked to " + target.name + ".");
      textln (name + " and " + target.name + " really hated each other! You thought that one of them might really hurt the other!!");
      x[whothat] = 6;
      target.x[whothis] = 6;
    } else if ((x[whothat] == 5) && (target.x[whothis] == 3)) {
      int dotheyhate = int (random(4));
      if (((dotheyhate == 0) && (x[4] == 2)) || ((dotheyhate == 0) && (target.x[4] == 2))) {
        textln (name + " and " + target.name + " had lunch together and talked over their conflict. They're not even sure what they were fighting about!");
        x[whothat] = 8;
        target.x[whothis] = 8;
      } else {
        textln (name + " talked to " + target.name + ".");      
        textln (name + " succesfully got under " + target.name + "'s skin. Now they both didn't like each other!");
        target.x[whothis] = 5;
      }
    } else if (x[whothat] == 5) {
      int dotheyhate = int (random(4));
      if (((dotheyhate == 0) && (x[4] == 2)) || ((dotheyhate == 0) && (target.x[4] == 2))) {
        textln (name + " really hated " + target.name + " pretty bad but he decided, you know, we're people. We're all just people trying to make it in this crazy world. Dang.");
        x[whothat] = 8;
        target.x[whothis] = 8;
      } else {
        textln (name + " talked to " + target.name + ".");
        textln (name + "'s inexplicable hatred of " + target.name + " was really starting to get on his nerves!");
        target.x[whothis] = 3;
      }
    } else if ((target.x[whothis] == 5) && (x[whothat] == 3)) {
      int dotheyhate = int (random(4));
      if (((dotheyhate == 0) && (x[4] == 2)) || ((dotheyhate == 0) && (target.x[4] == 2))) {
        textln (name + " and" + target.name + " had lunch together and talked about their biz. They really got some stuff figured out. They squashed their beef. It was a good day.");
        x[whothat] = 8;
        target.x[whothis] = 8;
      } else {
        textln (name + " talked to " + target.name + ".");
        textln (target.name + " finally managed to make " + name + " dislike " + target.name + " as much as " + target.name + " disliked " + name + "! What an asshole!");
        x[whothat] = 5;
      }
    } else if (target.x[whothis] == 5) {
      int dotheyhate = int (random(4));
      if (((dotheyhate == 0) && (x[4] == 2)) || ((dotheyhate == 0) && (target.x[4] == 2))) {
        textln (name + " had been mad at " + target.name + " for a while now but " + target.name + " finally managed to talk him down, using an allegory about an owl and a snake. It was lovely.");
        x[whothat] = 8;
        target.x[whothis] = 8;
      } else {
        textln (name + " talked to " + target.name + ".");
        textln (name + " had been ignoring " + target.name + "'s patent hatred of him for some time. He was starting to get worn down.");
        x[whothat] = 3;
      }
    }

    /* nervous/gregarious interactions. These are interactions that 'cure' fear when
     the object of fear turns out to be gregarious. The 'relaxed' status should be higher
     on the hierarchy to prevent the character from reverting to discomfort with the next 
     interaction. This should be the same as the uncomfortable/gregarious interaction, 
     but higher in the hierarchy */

    else if ((target.x[0] == 2) && (x[whothat+1] == 2)) {
      textln (name + " talked to " + target.name + ".");
      textln (name + " was extremely nervous, but " + target.name + "'s social graces defused the situation.");
      x[whothat+1] = 0;
      x[whothat] = 8;
    } else if  ((x[0] == 2) && (target.x[whothis+1] == 2)) {
      textln (name + " talked to " + target.name + ".");
      textln (name + " was extremely nervous, but " + target.name + "'s social graces defused the situation.");
      target.x[whothis+1] = 0;
      target.x[whothis] = 8;
    } 

    /* mutual friendship interactions. These do quite a few things. If characters are friends and one is 'erudite' or 'alluring' the other
     character may fall in love with them. There is also a chance that a character will stop being friends with a 'repugnant' character.
     If none of these things happen then one of ten messages will be printed. Eight of these describe the characters doing cute things
     together and have no other effects. The ninth makes both fall in love with each other, the tenth makes them stop being friends and become
     enemies. */

    else if ((x[whothat] == 2) && (target.x[whothis] == 2)) {
      int doeslovehappen = int (random(4));
      if ((doeslovehappen == 0) && ((x[3] == 2) || (x[5] == 2))) {
        textln (name + " talked to " + target.name + ".");
        textln (target.name + " had never noticed that " + name + " was so...wonderful.");
        textln (target.name + " fell in love with " + name);
        target.x[whothis] = 7;
      } else if ((doeslovehappen == 0) && ((target.x[3] == 2) || (target.x[5] == 2))) {
        textln (name + " talked to " + target.name + ".");
        textln ("Now that they had gotten to know one another, " + name + " was starting to feel very taken with " + target.name + ". Very taken indeed.");
        textln (name + " fell in love with " + target.name);
        x[whothat] = 7;
      } else {
        int repugnance = int (random(4));
        if ((repugnance == 0) && (x[3] == 1)) {
          textln (target.name + " was really starting to get turned off by " + name + "'s repugnance. He was not sure if he wanted to stay friends...");
          x[whothat] = 0;
          target.x[whothis] = 0;
        } else if ((repugnance == 0) && (target.x[3] == 1)) {
          textln (name + " was hanging out with " + target.name + " in a brightly lit place. " + name + " was having a hard time ignoring " + target.name + "'s unsightly appearance. " + target.name + " got this weird impression that " + name + " thought he was ugly, and started feeling insecure. It was a bad scene. They decided to stop hanging out. " + target.name + " was annoyed.");
          x[whothat] = 0;
          target.x[whothis] = 3;
        } else {
          int whatdofriendsdo = int (random(10));
          switch (whatdofriendsdo) {
          case 0:
            textln (name + " talked to " + target.name + ".");
            textln ("just two buds hangin' out.");
            break;
          case 1:
            textln (name + " helped " + target.name + " move into a new apartment. Afterwards they sat on the stoop, drinking beers and pointing at dogs.");
            break;
          case 2:
            textln (name + " and " + target.name + " went see a new exhibition at the village museum. It was a collection of Magritte paintings. 'I don't get it,' said " + name + " 'is it a pipe, or what. I'm confused by this Art.'");
            break;
          case 3:
            textln (name + " and " + target.name + " were enthusiastically playing twenty questions. 'Is it a deer?' asked " + target.name + " 'no, not even close' said " + name + ". " + target.name + " began to sweat. Only two guesses left.");
            break;
          case 4:
            textln (name + " and " + target.name + " talked about a tv show they both followed. 'Could you believe that scene last night, with the oranges, and the car battery?' asked " + name + ". 'You mean with the snowmobile, and the long close-up shot of the back door to the house?' said " + target.name + ". 'No. I could not.'");
            break;
          case 5:
            textln (name + " and " + target.name + " had spent the afternoon at the village's pool, beating the heat. 'No splashing,' " + target.name + " had said when they'd first arrived. But it was a joke. They both loved splashing.");
            break;
          case 6:
            textln (name + " and " + target.name + " had just gone to the carnival together. At the carnival, " + name + " had played the duck shooting game. He hit five ducks! They man at the booth gave them a giant teddy bear. They had no idea what to do with it.");
            break;
          case 7:
            textln (name + " and " + target.name + " were in a sort of a giddy mood. One of them would say 'Helena Blavatsky' and the other would giggle. You supposed it was some kind of inside joke. They seemed changed.");
            break;
          case 8:
            textln (name + " was helping " + target.name + " practice his baseball swing before the big game. 'no, do it like this,' said " + name + ", putting his arms around " + target.name + "'s torso as he did. His arms felt good like that. Their eyes met. A light rain started to fall.");
            textln (name + " and " + target.name + " were now IN LOVE.");
            x[whothat] = 7;
            target.x[whothis] = 7;
            break;
          case 9:
            textln (name + " and " + target.name + " had a big fight and " + target.name + " called " + name + " conceited. Their friendship was more or less ended.");
            x[whothat] = 3;
            target.x[whothis] = 3;
            break;
          }
        }
      }
    } 

    /* terror interactions. These cause a nervous character to become "too scared to speak" to 
     another character. The next time they interact, which ever character is 'x' will be become 
     wildly insecure, and try to reinvent themself. This will reset all of that character's 
     fear dispositions and randomize an attribute. This should be lower in the hierarchy than the
     gregarious interaction to allievate nervousness */

    else if ((x[whothat+1] == 2) && (target.x[whothis+1] == 2)) {
      textln (name + " and " + target.name + " became too scared to speak to each other.");
      x[whothat+1] = 3;
      target.x[whothis+1] = 3;
    } else if (x[whothat+1] == 2) {
      textln (name + " talked to " + target.name + ".");
      textln (name + "'s social anxiety became totally paralyzing!");
      x[whothat+1] = 3;
    } else if (target.x[whothis+1] == 2) {
      textln (name + " talked to " + target.name + ".");
      textln (target.name + "'s social anxiety became totally paralyzing!");
      target.x[whothis+1] = 3;
    }

    /* dislike/conciliatory interactions. Final chance for a character with the 'conciliatory' 
     attribute to resolve a conflict before dislike becomes 'hatred', which will slowly escalate
     to a conflict */

    else if ((x[whothat] == 4) && (target.x[4] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln ("In spite of " + name + "'s animosity, " + target.name + ", with his beatific personality, was able to reach an accord with " + name + ".");
      x[whothat] = 8;
      target.x[whothis] = 8;
    } else if ((target.x[whothis] == 4) && (x[4] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln ("In spite of " + target.name + "'s generally shitty attitude, " + name + ", with his saintlike personality, was able to come to an understanding with " + name + ".");
      x[whothat] = 8;
      target.x[whothis] = 8;
    }

    /* hatred interactions. These increase dislike to hatred. At this point dislike can still be
     one sided, which means that only mutual dislike should result in both characters hating each
     other. Should be just below the second chance for a 'conciliatory' character to cure dislike,
     which should in turn be just below nervous --> terrified in keeping with fear being slightly
     prioritized over emnity */

    else if ((target.x[whothis] == 4) && (x[whothat] == 4)) {
      textln (name + " talked to " + target.name + ".");
      textln (name + " and " + target.name + "'s mutual emnity escalated to outright hatred!");
      x[whothat] = 5;
      target.x[whothis] = 5;
    } else if (target.x[whothis] == 4) {
      textln (name + " talked to " + target.name + ".");
      textln (target.name + "'s ongoing antipathy towards "  + name + " reached the point of sincere hatred. Meanwhile, " + name + " remained oblivious.");
      target.x[whothis] = 5;
    } else if (x[whothat] == 4) {
      textln (name + " talked to " + target.name + ".");
      textln (name + "'s ongoing grudge against "  + target.name + " turned into an ardent hatred. Meanwhile, " + target.name + " still seemed unaware." );
      x[whothat] = 5;
    } 

    /* friendship interactions. Two "familiar" or "relaxed" characters will become friendly.
     This takes precendence over 'uncomfortable' or 'annoyed' dispositions, but more advanced
     states of these ('nervous' or 'dislike') will have to be resolved before characters can
     become friendly */

    else if ((x[whothat] == 1) && (target.x[whothis] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln (name + " became friends with " + target.name + ". That's cool.");
      x[whothat] = 2;
      target.x[whothis] = 2;
    } else if (((x[whothat] == 1) ||(x[whothat] == 8)) && ((target.x[whothis] == 1) || (target.x[whothis] == 8))) {
      textln (name + " talked to " + target.name + ".");
      textln ("In spite of their earlier difficulties, " + name + " and " + target.name + " became friends. Terrific.");
      x[whothat] = 2;
      target.x[whothis] = 2;
    }

    /* annoyed-conciliatory interactions. These allow conciliatory characters to allieviate
     the 'annoyance' condition. The characters will become relaxed; this will prevent an 
     eventual conflict */

    else if ((x[whothat] == 3) && (target.x[4] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln (name + " had been annoyed at " + target.name + ", but " + target.name + " acquitted himself well. They became relaxed.");
      x[whothat] = 8;
      target.x[whothis] = 8;
    } else if ((target.x[whothis] == 3) && (x[4] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln (target.name + " had been annoyed at " + name + ", but " + name + " acquitted himself well. They became relaxed.");
      x[whothat] = 8;
      target.x[whothis] = 8;
    }

    /* Unfriendly interactions. Dislike continues to escalate as 'annoyed' increases to 'unfriendly'.
     At this point dislike can still be wholly one-sided. This should be just below the conciliatory
     interaction to 'cure' dislike */

    else if ((target.x[whothis] == 3) && (x[whothat] == 3)) {
      textln (name + " talked to " + target.name + ".");
      textln (name + " and " + target.name + "'s mutual irritation escalated to mutual enmity.");
      x[whothat] = 4;
      target.x[whothis] = 4;
    } else if (target.x[whothis] == 3) {
      textln (name + " talked to " + target.name + ".");
      textln (target.name + "'s trifling annoyance with "  + name + " increased to a considerable dislike.");
      target.x[whothis] = 4;
    } else if (x[whothat] == 3) {
      textln (name + " talked to " + target.name + ".");
      textln (name + "'s minor annoyance with "  + target.name + " increased to the point of sincere dislike.");
      x[whothat] = 4;
    }

    /* uncomfortable/gregarious interactions. These are interactions that 'cure' discomfort when
     the object of discomfort turns out to be gregarious. The 'relaxed' status should be higher
     on the hierarchy to prevent the character from reverting to discomfort with the next interaction.
     This should be the same as the nervous/gregarious interaction, but lower in the hierarchy */

    else if ((target.x[0] == 2) && (x[whothat+1] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln ("Though uncomfortable, " + name + " found " + target.name + " to be a perfectly likeable person, and became relaxed.");
      x[whothat+1] = 0;
      x[whothat] = 8;
      target.x[whothis] = 8;
    } else if  ((x[0] == 2) && (target.x[whothis+1] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln ("Though uncomfortable, " + target.name + " found " + name + " to be a perfectly likeable person, and became relaxed.");
      target.x[whothis+1] = 0;
      target.x[whothis] = 8;
      x[whothat] = 8;
    } 

    /* nervous interactions. This causes discomfort to heighten to nervousness, 
     which if not stopped will eventually increase to terror. Should be lower in the hierarchy
     than the gregarious interaction to allieviate discomfort */
    else if ((x[whothat+1] == 1) && (target.x[whothis+1] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln (name + " and " + target.name + " were mutually uncomfortable and made each other nervous.");
      x[whothat+1] = 2;
      target.x[whothat+1] = 2;
    } else if (x[whothis+1] == 1) {
      textln (name + " talked to " + target.name + ".");
      textln (name + "'s discomfort increased.");
      x[whothat+1] = 2;
    } else if (target.x[whothis+1] == 1) {
      textln (name + " talked to " + target.name + ".");
      textln (target.name + "'s discomfort increased.");
      target.x[whothis+1] = 2;
    }

    /* !!! this is where interactions based purely on disposition begin. To keep character's stories from 
     repeating themselves after they have resolved love, hatred, or fear, it might be a good idea to throw
     in some events with a random chance of occuring */

    /* stupid/grandiloquent interactions. Stupid and grandiloquent characters
     will become friendly. This is up here in the hierarchy so that there are 
     at least SOME friendly interactions that take precedence over shyness/pugnacious */
    else if (((x[5] == 2) && (target.x[1] == 2)) || ((target.x[5] == 2) && (x[1] == 2))) {
      textln (name + " and " + target.name + " talked, with a great deal of bull-shitting, glad-handing, and politicking. They got along just fine.");
      x[whothat] = 1;
      target.x[whothis] = 1;
    }

    /* stupid/supersitious interactions. If a stupid person is not superstitious
     but meets a superstitious person they will also become superstitious. I just
     think this is funny */
    else if ((x[2] == 1) && (target.x[5] == 1)) {
      if (target.x[2] == 1) {
        textln (name + " and " + target.name + " sat close together, talking about the illuminati, subtle bodies, and something they called 'the absolute essence.' They seemed to be having a wonderful time.");
        x[whothat] = 2;
        target.x[whothis] = 2;
        textln (name + " and " + target.name + " are now good buds!");
      } else {
        textln (name + " talked to " + target.name + " about ley lines, pyramid power, and chaos magic. The whole biz. " + target.name + " was delighted.");
        target.x[2] = 1;
        textln (target.name + " became superstitious!");
      }
    } else if ((target.x[2] == 1) && (x[5] == 1)) {
      if (x[2] == 1) {
        textln (name + " and " + target.name + " had both recently completed a grueling month-long juice cleanse. They looked drained. But also, somehow...cleansed.");
        target.x[whothis] = 2;
        x[whothat] = 2;
        textln (target.name + " and " + name + " are now good buds!");
      } else {
        textln (target.name + " talked to " + name + " about ley lines, pyramid power, and chaos magic. The whole biz. " + name + " was delighted.");
        x[2] = 1;
        textln (name + " became superstitious!");
      }
    }


    /* uncomfortable interactions. This causes any shy character, or 
     a humble character talking to a smart or beautiful character, to
     become uncomfortable. This is a low priority interaction and 
     should not happen if characters already have friendship or 
     fear dispositions. Because this is a fear disposition it
     should be saved to "whothat + 1" */
    else if ((x[0] == 1) && (target.x[0] == 1)) {
      textln (name + " talked to " + target.name + ".");
      textln ("Their mutual awkwardness made the conversation difficult.");
      x[whothat+1] = 1;
      target.x[whothis+1] = 1;
    } else if ((x[0] == 1) || ((x[1] == 1) && ((target.x[3] == 2) || (target.x[5] == 2)))) {
      textln (name + " talked to " + target.name + ".");
      if (x[0] == 1) {
        textln (name + " became uncomfortable around " + target.name + " out of shyness.");
      } else {
        textln (name + " became uncomfortable around " + target.name + " from a feeling of inadequacy.");
      }
      x[whothat+1] = 1;
    } else if ((target.x[0] == 1) || ((target.x[1] == 1) && ((x[3] == 2) || (x[5] == 2)))) {
      textln (name + " talked to " + target.name + ".");
      if (target.x[0] == 1) {
        textln (target.name + " became uncomfortable around " + name + " out of shyness.");
      } else {
        textln (target.name + " became uncomfortable around " + name + " due to a feeling of inadequacy.");
      }
      target.x[whothis+1] = 1;

      /* annoyance interactions. These are attribute interactions that cause characters
       to start to dislike one another. Dislike will eventually cause characters to get
       in a fight, if not allieviated by the 'conciliatory' attribute. Mutual dislike 
       builds to conflict more quickly than one-sided dislike. Here two pugnacious 
       characters or an erudite and grandiloquent character will dislike each other mutually,
       and an erudite character meeting a supersitious character will dislike that character,
       and a pugnacious character meeting any other will dislike them. This should be
       just below anxiety in the hierarchy */
    } else if (((x[5] == 2) && (target.x[2] == 1)) || (x[4] == 2)) {      
      if (x[5] == 2) {
        textln (name + " talked to " + target.name + " about western medicine.");
        textln (name + " got sick of " + target.name + "'s archaic bullshit!");
      } else {
        textln (name + " talked to " + target.name + " about a contentious political issue.");        
        textln ("Ever mercurial, " + name + " became annoyed with " + target.name);
        if ((target.x[0] == 1) || (target.x[1] == 1)) {
          textln (target.name + " was extremely put off by " + name + "'s pugnacious behavior");
          target.x[whothis+1] = 2;
        }
      }
      x[whothat] = 3;
    } else if (((target.x[5] == 2) && (x[2] == 1)) || (target.x[4] == 2)) {
      if (target.x[5] == 2) {
        textln (name + " talked to " + target.name + " about the existence of ghosts.");       
        textln (target.name + " got sick of " + name + "'s archaic bullshit!");
      } else {
        textln (name + " talked to " + target.name + " about the results of a football game."); 
        textln ("Belligerent as usual, " + target.name + " became annoyed with " + name);
        if ((x[0] == 1) || (x[1] == 1)) {
          textln (name + " was extremely put off by " + target.name + "'s pugnacious behavior");
          x[whothat+1] = 2;
        }
      }
      target.x[whothis] = 3;
    } else if (((x[5] == 2) && (target.x[1] == 2)) || ((target.x[5] == 2) && (x[1] == 2))) {
      textln (name + " talked to " + target.name + " about a recent best-selling book.");
      textln (name + " decided that " + target.name + " was a pseudo-intellectual. The feeling was mutual.");
      x[whothat] = 3;
      target.x[whothis] = 3;
    }

    /* gregarious characters. Gregarious characters can become friendly with any other character, as long
     as one of the conditions for fear or annoyance has not already been met. */
    else if (x[0] == 2) {
      textln (name + " talked to " + target.name + ". " + name + " had a way with people, and put " + target.name + " at ease right away.");
      x[whothat] = 1;
      target.x[whothis] = 1;
    } else if (target.x[0] == 2) {
      textln (target.name + " talked to " + name + ". " + target.name + " was a particularly amiable and personable kind of guy, and they hit it off.");
      x[whothat] = 1;
      target.x[whothis] = 1;
    } 

    /*same attribute friendship. This is the lowest priority
     interaction and should only occur if there is nothing 
     interesting about the two characters meeting */
    else {
      textln (name + " talked to " + target.name + ".");
      for (int i = 0; i < 6; i++) {
        if ((x[i] == 1) && (target.x[i] == 1)) {
          textln (name + " became comfortable with " + target.name + " because they were both " + Attributes[3 * i + 1] + ".");
          x[whothat] = 1;
          target.x[whothis] = 1;
          i = 7;
        } else if ((x[i] == 2) && (target.x[i] == 2)) {
          textln (name + " became comfortable with " + target.name + " because they were both " + Attributes[3 * i + 2] + ".");
          x[whothat] = 1;
          target.x[whothis] = 1;
          i = 7;
        }
      }
    }
    textln (" ");
  }
}

