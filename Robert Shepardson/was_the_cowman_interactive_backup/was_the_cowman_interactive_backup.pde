import java.awt.TextArea; 

TextArea screen_text;

Character cowman;
Character gendarme;
Character tradesman;
Character indian;

/* these four arrays will be the "memory" of the four characters. 
 Four each global variable that is a letter a-d, a corresponds to
 cowman, b to gendarme, c to tradesman, d to indian. There are 
 not really 100 pieces of information stored (currently the number
 is in the 20s; this is just an arbitrarily high number to make it 
 easier to add features. Use of this memory is documented in the
 character tab */

int[] a = new int[100];
int[] b = new int[100];
int[] c = new int[100];
int[] d = new int[100];

/* Strings a-d will name the characters; "name" can be used for
 any character to print a sentence referring to that character. 
 Outside of the character tab the name string can be referenced 
 using, for example, cowman.name
 
 the array of "attributes" stores every possible "attribute" 
 (adjectives that can be assigned to characters by the "ask" 
 command). When this happens the characters int. array (above)
 will change to 1 or 2 depending on the attribute; the next time
 a "scene" is drawn, a seperate array within the character class
 will update to contain this string
 
 the array of "dispositions" store every possible way one 
 character can feel about another. This works similarly to
 attributes, but with values in the int array stored in four 
 different sections and different strings recorded to correspond
 to towards all four characters
 
 */

String a1 = "THE COWMAN";
String b1 = "THE GENDARME";
String c1 = "THE UNSKILLED TRADESMAN";
String d1 = "THE INDIAN SOVEREIGN";
String Attributes [] = {
  null, "a shrinking violet", "gregarious", null, "meek", "grandiloquent", null, "superstitious", "evil", null, "repugnant", "alluring", null, "conciliatory", "pugnacious", null, "stupid", "erudite"
};
String Dispositions [] = {
  null, "familiar", "friendly", "annoyed", "unfriendly", "hateful", "mortally hateful", "in love with", "relaxed", null, "uncomfortable", "nervous", "terrified"
};
String Professions [] = {
  "Mad Scientist", "Wizard", "Fighter", "Sideshow Freak", "Moderately Acclaimed Writer", "Politician", "Huge Nerd", "Total Heart-Throb", "Thief", "Jock", "Doctor", "Preacher Man"
};
String ProfessionStories [] = {
  "hey there. it's me. treat. if this text is being printed then you got an error, bub. you don't wanna see this text get printed.", " had just embarked on a career as a Mad Scientist. He was too busy researching the most Evil types of science to actually do anything evil.", " was becoming very skilled at Mad Science. He began constructing a laser.", " had finished constructing his Doomsday Laser. He demanded riches!!", " did not receive his demanded riches. Spiteful, he destroyed the local HOSPITAL. He became terribly powerful.", 
  " didn't talk to anyone. He had just started studying to be a Wizard. He seemed to be buried in a tome of Ancient Lore.", " had advanced in his career as a Wizard. Strange amulets hung from his neck. He had learned the seven secrets of hermes trismegistus.", " had become a venerated Wizard. The forty-nine seals of power scintillated above his head. The air around him seemd to crackle with electricity.", " gained to a heretofore unthinkable level of power!!", 
  " had decided to become a Fighter. He kept to himself, punching a sandbag over and over. 'I am imagining that this sandbag is the Adversity I have faced', he said, to himself.", " had begun going daily to the village fighting ring. He began to be known around town as an up and coming Fighter. Oddsmakers sang his praises. He even knocked out Strong Jim!", " was wearing a large gold medal. He had become the Heavyweight Champion of the Village!", " attained a considerable fortune and formidable STRENGTH!", 
  " had gone out earlier in search of a Sideshow Freak job. He'd found a small circus that happened to be in town. 'Hello, I'd like to inquire about opportunities for Freaks at this circus, ' he had said to a man in a top hat. The man had hired him on the spot.", " was making a decent living at his Freak job, but sometimes he worried: was he just helping people who wanted to laugh at him? Could he ever really come into his own as a Freak?", " had come into his own as a Freak. He exuded an incredible level of assurance and charisma.", " became DESIRABLE because of, not in spite of, his deformity", 
  " had decided to become a Writer. He sat and glared at a typewriter. He began drinking.", " was Depressed. His Writings attained moderate acclaim. He remained Depressed.", " removed all the punctuation from his diary and sent it to a publisher on a whim. It was a surprise bestseller!", " All characters were now DEPRESSED. He made MONEY off of their sadness.", 
  " had decided to get into Politics! He'd spent the whole day stumping around the village, trying to secure votes in the next congressional election!", "'s political career was going swimmingly! He had made it to Washington, where a multinaitonal chemical interest had paid him A BUCK AND A HALF to let them build a controversial new plant in his district", " seemed tense. He had become embroiled in a corruption scandal.", "'s reputation had been destroyed. He was forever tarnished in the eyes of his peers. On the other hand, he now had MONEY. a lot of it. Oh yeah, and the factory? It made literally everyone sick.", 
  " was a Huge Nerd. He didn't talk to anyone. He was playing video games online.", " had gotten sick of video games. He was watching season 13, episode 10 of the simpsons on his laptop. 'Hmm...' he said.", " had become an internet billionaire.", " was rich now. 'I don't need friends anymore, because I have my wealth now', he said. ", 
  " did not yet know himself to be a Sexy Heart Throb. He saw his reflection in a mirror. 'That is not my reflection as I am not that Sexy,' he said.", " had recently started to think he might be a Heart Throb. He had googled 'ways to know if u are a sexy heart throb'. The results were not conclusive.", " had accepted that he was a sexy heart throb. 'I am a highly attractive individual and that is okay. There is more to me than just sex appeal,' he said.", "Nothing happened as a result of this!", 
  " began his career as a Thief. Actually he wasn't a thief yet. He was more a footpad. A wet-ear, if you will, a brigand. He was sort of knave. Maybe a highwayman. A rogue, that's it, he was just a rogue, for now.", " had finally become a full-blown thief. To celebrate, he robbed your house. He made off with all of your jewelry. Sorry!", " was a master thief. He was at the top of his profession, he could rob anything. He robbed all the other characters.", "Everyone else lost their WEALTH!", 
  " was a Jock now. He couldn't hang out because he had become the running back for the high school football team. He rushed for an average of 8 1/3 yards per carry. All eyes were on him.", " blew his knee out at an out of town game! Nowhere to go but down, down, down!", " Had made a whole bunch of new friends, people he used to look down on. However, he still resolved to beat up a nerd, should he encounter one.", ", finding no suitable dorks, resigned himself to a life of peace and conflict resolution.", 
  " had decided to become a Doctor. So I was actually lying when I said he was there. I meant to say that he was away, at med school. I regret this error.", " had become a licensed physician. He was standing around, clipboard in his hands, stethoscope around his neck. He looked confused...something was wrong...", " suddenly exclaimed, 'I know what's wrong with this village! We don't have a hospital! I need to build this village a hospital!!", " built a hospital. There was now a hospital.", 
  " began his career as a Preacher Man. He went door to door preaching.", " was still on his Preaching Crusade. 'Thank you for preaching to us, Preacher Man.' some families would say, when he'd finished preaching to them. 'Go away, Preacher Man,' others would say. 'We don't need your Preachin' around here'. Preacher Man felt unsure of himself.", " abruptly said, 'Eureka! I know what to do! I'll found a church! Then only people who want to hear my trademark Preachin' will have to hear it!", " founded his own church. All agnostic characters became SUPERSTITIOUS."
};
String SpecialInteractions [] = {
  "You HIT THE GYM TOGETHER", " You TOLD HIM SOMETHING SAD", " You CAST HIM IN A PLAY", " You decided to PISS HIM OFF", " You were sick. You decided to SNEEZE ON HIM", "The moon was full. He began TRANSFORMING!", " He was sort of boring you. You decided to FIRE CUPID'S ARROW at him!", " became stronger!", " was now DEPRESSED!", " received rave reviews and was now considered ALLURING!", " was now PUGNACIOUS", " became SICK!", " was a now a WEREWOLF!!", " fell in love WITH SOMEONE AT RANDOM, PERHAPS EVEN, IN A TWIST WORTHY OF SHAKESPEARE, HIMSELF!"
};

String DepressionEvents [] = {
  "uh-oh, if this is being printed then there's a bug somewhere!", " was abject and heartbroken. He talked to no one.", " was depressed, and had begun drinking heavily! His friends were concerned, but what could they say? He had become angry, defensive.", " had started attending AA meetings. He finally felt that maybe his life wasn't already over. Things were looking up. He was taking it one day at a time."
};

/* these numbers are also stored in the int. array and are used 
 to conveniently "identify" the character that is being looked at;
 most of the time this is when once character is interacting with
 the other. Both characters must store information pertaining to 
 the other character; this is done by having each character 'read'
 the id (stored in int array location 6) and then multiply it by
 4 (the number of categories of dipositions) and add 7 (the number
 of the first disposition) plus the number of the disposition 
 category in question.
 For example, the gendarme's id is '1', which means that
 dispositions towards the gendarme start in the int array at 
 location 1 * 4 + 7, or x[11]. Fear is the second type of 
 disposition, so if a character becomes afraid of the gendarme, 
 they will write a '1' to x[12].
 The meaning of particular values for dispositions is documented
 in the character tab. Assigning dispositions occurs in the 
 'interact' function (int) and 'update' (saves the correct strings
 within the character class) */

int a2 = 0;
int b2 = 1;
int c2 = 2;
int d2 = 3;

int scene = 0; //determines which characters appear when a scene is drawn
int yn = 0;  //remembers whether y or n has been pressed, possibly useless
int keyneed = 0; //determines whether the program will accept y/n or ENTER as input
int attinquestion; //remembers what attribute has just been asked about; this is probably needed because making the program interacive within aks() fucks everything up
int whichattinq; //two opposite characteristics are stored in each array x[], so this is used with attinquestion to determine exactly which is being asked about
int whatchar; //a character's id may be stored here
int characterinfo = 0; //used to toggle character information. 0 is off, 1 is on
int isthereahospital = 0; //if a character is assigned the 'doctor' class they can build a hospital, which will cure wounded characters. The hospital can be destroyed by a mad scientist.
int specialevent = 0; //when something dramatic happens in the first interact() in a scene, it is anticlimactic and sometimes incongruous to have two other characters talking afterwards. So this becomes set to one and the scene() program ignores the second interaction.
int storyover = 0; //when the story ends 'specialevent = 1;' is not sufficient, because 'ask()' will still happen. In this case we need 'storyover = 1', which will prevent both ask() and the second interaction if there would have been one
int isittaken [] = new int [12]; //each counter correspond to one of the 12 professions. When a profession is assigned the corresponding integer will be set to one, preventing the same profession from being assigned to another character

void setup() {
  size(500, 400);
  screen_text = new TextArea("", 23, 45, 1); 
  this.add(screen_text);
  background(255);
  cowman = new Character (a, a1, a2);
  gendarme = new Character (b, b1, b2);
  tradesman = new Character (c, c1, c2);
  indian = new Character (d, d1, d2);
  noLoop();
}

void textln(String text_to_print) {
  println(text_to_print);
  screen_text.append(text_to_print + "\n");
}

//from Lee's processing examples
String random_string (String[] string_array) {
  return string_array[int(random(string_array.length))];
}


String setting () {
  String settings [] = {
    "in another bar", "in a spooky cave", "discreetly, in a public place", "at a birthday party", "on a raft in the middle of the sea", "in a timeless expanse", "at the bottom of a hole", "in prison", "at the Y", "by coincidence at a take-out place", "in the last good town in America", "when you died", "at your place, friday night, to play Parcheesi", "atop Lookout Hill", "at the Village Center", "at the Village Outskirts", "in front of the lion enclosure at the zoo", "working at the lion enclosure at the zoo", "while trying to track down the lions that had escaped from the zoo", "in the middle of a strange ritual", "in the 'occult' section of the library", "in the secret tunnels beneth the lion enclosure at the zoo"
  };
  return random_string(settings);
}

void cast(Character x) {
  x.update();
  x.introduce();
}

void askc(Character x, Character y, Character z) {
  if (keyneed == 10) {
  }
  int askc = int(random(3));
  switch (askc) {
  case 0: 
    x.ask();
    break;
  case 1: 
    y.ask();
    break;
  case 2: 
    z.ask();
    break;
  }
}

/* scene. Selects three characters, prints information about them if character information is on, 
 performs two interaction (unless the first interaction involves a special event), and then performs
 the ask() function, which in turn prints 'press enter to continue', and makes it possible for the 
 scene function to run again. Circle of life. Weird nested boolean statements give the option of skipping
 the second interaction ( for special events) or skipping the whole rest of the scene (originally only used
 when the story ends; however, there are some other events that use storyover = 1 to skip the rest of a scene,
 but do not actually end the story */

void scene() {
  specialevent = 0;
  int who = int(random(4));
  switch (who) {
  case 0: 
    scene = 1;
    cast(cowman);
    cast(gendarme);
    cast(tradesman);
    textln (" ");
    cowman.converse(gendarme);
    if (storyover == 1) {
    } else {
      if (specialevent == 1) {
      } else {
        gendarme.converse(tradesman);
      }
      if (storyover != 1) {   
        askc(cowman, gendarme, tradesman);
      }
    }
    break;
  case 1:
    scene = 2;
    cast(cowman);
    cast(gendarme);
    cast(indian);
    textln (" ");
    cowman.converse(indian);
    if (storyover == 1) {
    } else {
      if (specialevent == 1) {
      } else {
        indian.converse(gendarme);
      }
      if (storyover != 1) {
        askc(cowman, gendarme, indian);
      }
    }
    break;
  case 2:
    scene = 3;
    cast(cowman);
    cast(tradesman);
    cast(indian);
    textln (" ");
    cowman.converse(tradesman);
    if (storyover == 1) {
    } else {
      if (specialevent == 1) {
      } else {
        tradesman.converse(indian);
      }
      if (storyover != 1) {
        askc(cowman, tradesman, indian);
      }
    }
    break;
  case 3:
    scene = 4;
    cast(gendarme);
    cast(tradesman);
    cast(indian);
    textln (" ");
    gendarme.converse(tradesman);
    if (storyover == 1) {
    } else {
      if (specialevent == 1) {
      } else {
        tradesman.converse(indian);
      }
      if (storyover != 1) {
        askc(gendarme, tradesman, indian);
      }
    }
    break;
  }
}

void again() { 
  textln ("~~you met THREE MEN " + setting() + "~~");
  textln (" ");
  scene();
}

void draw() {
  textln ("[character information is currently OFF. Press 'c' to toggle character information. Press i for CHARACTER INFO]");
  textln (" ");
  textln ("~~you met THREE MEN in a bar...~~");
  textln ("  ");
  scene();
  keyneed = 2;
}

void keyPressed () {

  if (keyneed == 1) {
    if ((key == ENTER) || (key == RETURN)) {
      again();
    }
  }

  if (keyneed == 2) {
    if ((key == 'y') || (key == 'Y')) {
      textln ("");
      textln ("yes.");
      textln ("");
      switch (whatchar) {
      case 0:
        cowman.x[attinquestion] = whichattinq;
        cowman.CheckProfession();
        break;
      case 1:
        gendarme.x[attinquestion] = whichattinq;
        gendarme.CheckProfession();
        break;
      case 2:
        tradesman.x[attinquestion] = whichattinq;
        tradesman.CheckProfession();
        break;
      case 3:
        indian.x[attinquestion] = whichattinq;
        indian.CheckProfession();
        break;
      }
      keyneed = 3;
    } else if ((key == 'n') || (key == 'N')) {
      textln ("");
      textln ("no.");
      textln ("");
      keyneed = 3;
    }
  }

  if (keyneed == 3) {

    textln ("press ENTER to continue");
    textln (" ");
    textln (" ");
    keyneed = 1;
  }


  if (key == 'c') {
    if (characterinfo == 0) {
      textln ("Character Information is now ON. press c to toggle Character Information. Press i for an INFO SCREEN");
      characterinfo = 1;
    } else {
      textln ("Character Information is now OFF. press c to toggle Character Information. Press i for an INFO SCREEN");
      characterinfo = 0;
    }
  }
  
  if (key == 'i') {
    textln(" ");
    textln ("~~~~");
    textln("CURRENT INFORMATION:");
    textln (" ");
    cowman.characterinfo();
    gendarme.characterinfo();
    tradesman.characterinfo();
    indian.characterinfo();
    textln ("~~~~");
  }
}

