/** Lista com as Text Boxes aceitas na janela de Login */
private ArrayList<TextBox> textboxes = new ArrayList<TextBox>();

TextBox rSquare;
TextBox gSquare;
TextBox bSquare;



/** 
 * Configurações iniciais para o editor gráfico.
 */
public void setup() {
   size(800, 450);
   background(255, 255, 255);

   rSquare = new TextBox();
   rSquare.X = 25;
   rSquare.Y = 50;
   rSquare.W = 150;
   rSquare.H = 40;

   gSquare = new TextBox();
   gSquare.X = 25;
   gSquare.Y = 100;
   gSquare.W = 150;
   gSquare.H = 40;

   bSquare = new TextBox();
   bSquare.X = 25;
   bSquare.Y = 150;
   bSquare.W = 150;
   bSquare.H = 40;

   textboxes.add(rSquare);
   textboxes.add(gSquare);
   textboxes.add(bSquare);
}

/** 
 * Desenha o editor gráfico na tela.
 */
public void draw() {
    // Define a cor do texto
    fill(0, 0, 0);
    textSize(16);
    text("Quadrado", 15, 25);
    text("R", 10, 75);
    text("G", 10, 125);
    text("B", 10, 175);

    line(250, 0, 250, height);

    for (TextBox t : textboxes) {
        t.DRAW();
    }
}

/** 
* Evento de precionar botão do mouse. 
*/
public void mousePressed() {
    for (TextBox t : textboxes) {
        t.PRESSED(mouseX, mouseY);
    }
    
    if (mouseX > 250) {
        drawSquare();
    }
}

/** 
 * Evento de precionar tecla do teclado.
 */
public void keyPressed() {
    for (TextBox t : textboxes) {
        t.KEYPRESSED(key, (int) keyCode);
    }
}

private void drawSquare() {
    fill(255, 255, 255);
    stroke(color(int(rSquare.Text), int(gSquare.Text), int(bSquare.Text)));
    rectMode(CENTER);
    rect(mouseX, mouseY, 100, 100);

    rectMode(CORNER);
    stroke(0, 0, 0);
}