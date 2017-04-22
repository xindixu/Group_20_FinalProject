class Screen{
  
  ArrayList<String> text;
  ArrayList<PVector> pos;
  ArrayList<Integer> txc;
  ArrayList<PFont> txf;
  //ArrayList<GUI> gui;
  PVector[] buttonPos;
  
  Screen(){
    this.text = new ArrayList();
    this.pos = new ArrayList();
    this.txc = new ArrayList();
    this.txf = new ArrayList();
    buttonPos = new PVector[4];
  }
  
  void construct(String[] text, PVector[] pos, color[] txc, PFont[] txf, PVector[] bPos){
    for(int i = 0; i < pos.length; i ++){
      addText(text[i],pos[i],txc[i],txf[i]);
    }
    this.buttonPos = bPos.clone();
  }
  
  
  void addText(String text, PVector pos, color txc, PFont txf){
    this.text.add(text);
    this.pos.add(pos);
    this.txc.add(txc);
    this.txf.add(txf);
  }
  
  void updateText(int i, String text){
    this.text.set(i,text);
  }
  
  
  void display(){
    image(en.bg,0,0);
    for(int i = 0; i < pos.size(); i ++){
      fill(txc.get(i));
      textFont(txf.get(i));
      text(text.get(i),pos.get(i).x,pos.get(i).y);
    } 
  }
}

void setupScreen(){
  
  String[] pText = {"Pause","Click the button to resume the game."};
  PVector[] ppos = {new PVector(width/2,100),new PVector(width/2,130)};
  int[] pTxc = {color(255),color(255)};
  PFont[] pTxf = {createFont("Comic Sans MS Bold",32),createFont("Comic Sans MS Bold",20)};
  PVector[] pBttnPos ={new PVector(-30,200),new PVector(30,250),new PVector(30,300),new PVector(-30,350),new PVector(30,400)};
  
  String[] gText = {"Score:","Life:"};
  PVector[] gpos = {new PVector(10,20),new PVector(10,40)};
  int[] gTxc = {color(255),color(255)};
  PFont[] gTxf = {createFont("Comic Sans MS Bold",20),createFont("Comic Sans MS Bold",20)};
  PVector[] gBttnPos = {new PVector(-30,200),new PVector(30,250),new PVector(-30,300),new PVector(30,350),new PVector(30,400)};
  
  String[] wText = {"Congrats!","Your score:",""};
  PVector[] wpos = {new PVector(500,100),new PVector(500,130),new PVector(630,130)};
  int[] wTxc = {color(255),color(255),color(255)};
  PFont[] wTxf = {createFont("Comic Sans MS Bold",32),createFont("Comic Sans MS Bold",20),createFont("Comic Sans MS Bold",20)};
  PVector[] wBttnPos = {new PVector(-30,200),new PVector(30,250),new PVector(-30,300),new PVector(-30,350),new PVector(30,400)};
  
  
  String[] lText = {"Loser!","Your score:",""};
  PVector[] lpos = {new PVector(width/2,100),new PVector(width/2,130),new PVector(630,130)};
  int[] lTxc = {color(255),color(255),color(255)};
  PFont[] lTxf = {createFont("Comic Sans MS Bold",32),createFont("Comic Sans MS Bold",20),createFont("Comic Sans MS Bold",20)};
  PVector[] lBttnPos = {new PVector(-30,200),new PVector(30,250),new PVector(-30,300),new PVector(-30,350),new PVector(30,400)};
  
  Screen game = new Screen();
  Screen pause = new Screen();
  Screen win = new Screen(); 
  Screen lose = new Screen();
  
  game.construct(gText,gpos,gTxc,gTxf,gBttnPos);
  pause.construct(pText,ppos,pTxc,pTxf,pBttnPos);
  win.construct(wText,wpos,wTxc,wTxf,wBttnPos);
  lose.construct(lText,lpos,lTxc,lTxf,lBttnPos);
  
  en.screen.put("Game",game);
  en.screen.put("Win",win);
  en.screen.put("Lose",lose);
  en.screen.put("Pause",pause);
}