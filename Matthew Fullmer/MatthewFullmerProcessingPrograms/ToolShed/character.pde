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

  void update() {
    y[0] = Attributes [x[0]];
    y[1] = Attributes [x[1]+3];
    y[2] = Attributes [x[2]+6];
    y[3] = Attributes [x[3]+9];
    y[4] = Attributes [x[4]+12];
    y[5] = Attributes [x[5]+15];
    z[0] = Dispositions [x[7]];
    z[4] = Dispositions [x[11]];
    z[8] = Dispositions [x[15]];
    z[13] = Dispositions [x[19]];
  }

  void checkdis (int x, int y, Character q) {
    for (int j = x; j < y; j++) {
      if (z[j] == null) {
      } else {
        textln (name + " felt " + z[j] + " with " + q.name + ".");
      }
    }
  }


  void introduce() {
    SHtextln (name + " was there.");
    for (int i = 0; i < 6; i++) {
      if (y[i] == null) {
      } else {
        SHtextln (name + " was " + y[i] + ".");
      }
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

  void ask() {
    if ((x[0] == 0) || (x[1] == 0) || (x[2] == 0) || (x[3] == 0) || (x[4] == 0) || (x[5] == 0)) {
      int at = int (random (6));
      if (x[at] == 0) {
        int i = int(random(2));
        if (i == 0 ) {
          SHtextln("was " + name + " " + Attributes[(3*at)+1] +"? (y/n)");
          int j = int(random(2));
          if (j == 0) {
            SHtextln ("yes.");
            SHtextln (" ");
            x[at] = 1;
          }
          if (j == 1) {
            textln ("no.");
            textln (" ");
          }
        } else {
          SHtextln("was " + name + " " + Attributes[(3*at)+2] +"? (y/n)");
          int j = int(random(2));
          if (j == 0) {
            SHtextln ("yes.");
            SHtextln (" ");
            x[at] = 2;
          }
          if (j == 1) {
            SHtextln ("no.");
            SHtextln (" ");
          }
        }
      } else { 
        ask();
      }
    } else {
    }
  }

  void converse(Character y) {
    int whothis = (x[6]) * 4 + 7;
    int whothat = (y.x[6]) * 4 + 7;
    SHtextln (name + " talked to " + y.name + ".");
    if ((x[whothat] == 2) && (y.x[whothis] == 2)) {
      SHtextln ("just two buds hangin' out.");
    } else if ((x[whothat] == 1) && (y.x[whothis] == 1)) {
      SHtextln (name + " became friends with " + y.name + ". That's cool.");
        x[whothat] = 2;
      y.x[whothis] = 2;
    } else {
      for (int i = 0; i < 6; i++) {
        if ((x[i] == 1) && (y.x[i] == 1)) {
          SHtextln (name + " became comfortable with " + y.name + " because they were both " + Attributes[3 * i + 1] + ".");
          x[whothat] = 1;
          y.x[whothis] = 1;
        } else if ((x[i] == 2) && (y.x[i] == 2)) {
          SHtextln (name + " became comfortable with " + y.name + " because they were both " + Attributes[3 * i + 2] + ".");
          x[whothat] = 1;
          y.x[whothis] = 1;
        }
      }
    }
    SHtextln (" ");
  }
}

