class Screen {

  ArrayList<String> text;
  ArrayList<PVector> pos;
  ArrayList<Integer> txc;
  ArrayList<PFont> txf;
  PVector[] buttonPos;
  int[] buttonSize;

  Screen() {
    this.text = new ArrayList();
    this.pos = new ArrayList();
    this.txc = new ArrayList();
    this.txf = new ArrayList();
    buttonPos = new PVector[9];
    buttonSize = new int[9];
  }

  void construct(String[] text, PVector[] pos, color[] txc, PFont[] txf, PVector[] bPos, int[] bSize) {
    for (int i = 0; i < pos.length; i ++) {
      addText(text[i], pos[i], txc[i], txf[i]);
    }
    this.buttonPos = bPos.clone();
    this.buttonSize = bSize.clone();
  }


  void addText(String text, PVector pos, color txc, PFont txf) {
    this.text.add(text);
    this.pos.add(pos);
    this.txc.add(txc);
    this.txf.add(txf);
  }

  void updateText(int i, String text) {
    this.text.set(i, text);
  }


  void display() {
    image(en.bg, 0, 0);
    for (int i = 0; i < pos.size(); i ++) {
      fill(txc.get(i));
      textFont(txf.get(i));
      text(text.get(i), pos.get(i).x, pos.get(i).y);
    }
  }
}

void setupScreen() {  
  //{"Start", "Restart", "Resume", "Pause", "Quit", "Music", "High_score", "Info", "Home"};
  //{"Game","Pause","Win","Lose","Home"};
  String[] hText = {"CATFORMER THE GAME"};
  PVector[] hpos = {new PVector(900, 100)};
  int[] hTxc = {color(0), color(0, color(0))};
  PFont[] hTxf = {createFont("Comic Sans MS Bold", 48)};
  PVector[] hBttnPos ={new PVector(30, 150), new PVector(-30, 200), new PVector(-30, 250), new PVector(-30, 300), new PVector(30, 350), new PVector(30, 400), new PVector(30, 450), new PVector(30, 500), new PVector(-30, 550), new PVector(-30, 600)};
  int[] hBttnSize = {50,50,50,50,50,50,50,50,50};
  
  String[] pText = {"Pause", "Click the button to resume the game."};
  PVector[] ppos = {new PVector(width/2, 100), new PVector(width/2, 130)};
  int[] pTxc = {color(0), color(0), color(0)};
  PFont[] pTxf = {createFont("Comic Sans MS Bold", 32), createFont("Comic Sans MS Bold", 20)};
  PVector[] pBttnPos ={new PVector(-30, 150), new PVector(30, 200), new PVector(30, 250), new PVector(-30, 300), new PVector(30, 350), new PVector(30, 400), new PVector(30, 450), new PVector(30, 500), new PVector(30, 550), new PVector(30, 600)};
  int[] pBttnSize = {50,50,50,50,50,50,50,50,50};

  String[] gText = {" "," "};
  PVector[] gpos = {new PVector(10, 20), new PVector(10, 40)};
  int[] gTxc = {color(255), color(255)};
  PFont[] gTxf = {createFont("Comic Sans MS Bold", 20), createFont("Comic Sans MS Bold", 20)};
  PVector[] gBttnPos = {new PVector(-30, 150), new PVector(-30, 200), new PVector(-30, 250), new PVector(30, 300), new PVector(30, 350), new PVector(30, 400), new PVector(30, 450), new PVector(-30, 500), new PVector(-30, 550), new PVector(-30, 600)};
  int[] gBttnSize = {50,50,50,50,50,50,50,50,50};
  
  String[] wText = {"Congrats!", "Your score:", ""};
  String t = "Enter Your Initials:";
  String d = "";
  //Box enterHighScore = new Textbox("Text_box", 700, 500, t, d, new PVector(width/2-350, height/2-250),true, 100, 200);
  //en.box.put("Enter_High_Score",enter_high_score);
  //enterHighScore.display();
  PVector[] wpos = {new PVector(50, 50), new PVector(50, 80), new PVector(180, 80)};
  int[] wTxc = {color(255), color(255), color(255)};
  PFont[] wTxf = {createFont("Comic Sans MS Bold", 32), createFont("Comic Sans MS Bold", 20), createFont("Comic Sans MS Bold", 20)};
  PVector[] wBttnPos = {new PVector(-30, 150), new PVector(30, 200), new PVector(-30, 250), new PVector(-30, 300), new PVector(30, 350), new PVector(30, 400), new PVector(30, 450), new PVector(30, 500), new PVector(30, 550), new PVector(30, 600)};
  int[] wBttnSize = {50,50,50,50,50,50,50,50,50};


  String[] lText = {"Loser!", "Your score:", ""};
  PVector[] lpos = {new PVector(50, 50), new PVector(50, 80), new PVector(180, 80)};
  int[] lTxc = {color(0), color(0), color(0)};
  PFont[] lTxf = {createFont("Comic Sans MS Bold", 32), createFont("Comic Sans MS Bold", 20), createFont("Comic Sans MS Bold", 20)};
  PVector[] lBttnPos = {new PVector(-30, 150), new PVector(30, 200), new PVector(-30, 250), new PVector(-30, 300), new PVector(30, 350), new PVector(30, 400), new PVector(30, 450), new PVector(30, 500), new PVector(30, 550), new PVector(30, 600)};
  int[] lBttnSize = {50,50,50,50,50,50,50,50,50};
  
  Screen game = new Screen();
  Screen pause = new Screen();
  Screen win = new Screen(); 
  Screen lose = new Screen();
  Screen home = new Screen();


  home.construct(hText, hpos, hTxc, hTxf, hBttnPos,hBttnSize);
  game.construct(gText, gpos, gTxc, gTxf, gBttnPos,gBttnSize);
  pause.construct(pText, ppos, pTxc, pTxf, pBttnPos,pBttnSize);
  win.construct(wText, wpos, wTxc, wTxf, wBttnPos,wBttnSize);
  lose.construct(lText, lpos, lTxc, lTxf, lBttnPos,lBttnSize);


  en.screen.put("Home", home);
  en.screen.put("Game", game);
  en.screen.put("Win", win);
  en.screen.put("Lose", lose);
  en.screen.put("Pause", pause);
}