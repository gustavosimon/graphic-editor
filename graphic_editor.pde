/** Lista com as Text Boxes aceitas na janela do Editor Gráfico */
private ArrayList<TextBox> textboxes = new ArrayList<TextBox>();

/** TextBox com a configuração da cor Red do quadrado */
TextBox rSquare;
/** TextBox com a configuração da cor Green do quadrado */
TextBox gSquare;
/** TextBox com a configuração da cor Blue do quadrado */
TextBox bSquare;
/** TextBox com a configuração de largura do quadrado */
TextBox wSquare;
/** TextBox com a configuração de altura do quadrado */
TextBox hSquare;

/** TextBox com a configuração da cor Red do círculo */
TextBox rCircle;
/** TextBox com a configuração da cor Green do círculo */
TextBox gCircle;
/** TextBox com a configuração da cor Blue do círculo */
TextBox bCircle;
/** TextBox com a configuração de diâmetro do círculo */
TextBox dCircle;

/** Boolean para indicar se está desenhando círculos ou quadrados */
boolean drawCircle = false;

/** 
 * Configurações iniciais para o editor gráfico.
 */
public void setup() {
   size(800, 600);
   background(255, 255, 255);

    // Configura as Text Boxes com as customizações

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

   wSquare = new TextBox();
   wSquare.X = 25;
   wSquare.Y = 200;
   wSquare.W = 150;
   wSquare.H = 40;

   hSquare = new TextBox();
   hSquare.X = 25;
   hSquare.Y = 250;
   hSquare.W = 150;
   hSquare.H = 40;

   rCircle = new TextBox();
   rCircle.X = 25;
   rCircle.Y = 350;
   rCircle.W = 150;
   rCircle.H = 40;

   gCircle = new TextBox();
   gCircle.X = 25;
   gCircle.Y = 400;
   gCircle.W = 150;
   gCircle.H = 40;

   bCircle = new TextBox();
   bCircle.X = 25;
   bCircle.Y = 450;
   bCircle.W = 150;
   bCircle.H = 40;

   dCircle = new TextBox();
   dCircle.X = 25;
   dCircle.Y = 500;
   dCircle.W = 150;
   dCircle.H = 40;

   textboxes.add(rSquare);
   textboxes.add(gSquare);
   textboxes.add(bSquare);
   textboxes.add(wSquare);
   textboxes.add(hSquare);

   textboxes.add(rCircle);
   textboxes.add(gCircle);
   textboxes.add(bCircle);
   textboxes.add(dCircle);

}

/** 
 * Desenha as configurações do editor gráfico na tela.
 */
public void draw() {
    
    textSize(16);
    text("Quadrado", 15, 25);
    text("Círculo", 15, 325);

    // Configurações do quadrado    
    text("R", 10, 75);
    text("G", 10, 125);
    text("B", 10, 175);
    text("L", 10, 225);
    text("A", 10, 275);

    // Configurações do círculo
    text("R", 10, 375);
    text("G", 10, 425);
    text("B", 10, 475);
    text("D", 10, 525);

    // Desenha a linha divisória entre as configurações e a área de desenho
    line(250, 0, 250, height);

    // Desenha as Text Boxes de configurações
    for (TextBox t : textboxes) {
        t.DRAW();
    }
}

/** 
* Evento de precionar botão do mouse. 
*/
public void mousePressed() {
    // Se a última configuração selecionado foi de círculo, indica que deve desenhar círculos
    if (rCircle.selected || gCircle.selected || bCircle.selected || dCircle.selected) {
        drawCircle = true;
    // Se a última configuração selecionado foi de quadrado, indica que deve desenhar quadrados
    } else if (rSquare.selected || gSquare.selected || bSquare.selected || wSquare.selected || hSquare.selected) {
        drawCircle = false;
    }

    // Varre os Text Boxes para inserir o que foi digitado
    for (TextBox t : textboxes) {
        t.PRESSED(mouseX, mouseY);
    }
    
    // Testa se clicou o mouse na área de desenho (área permitida)
    if (mouseX > 250) {
        if (drawCircle) {
            drawCircle();
        } else {
            drawSquare();
        }
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

/** 
 * Desenha um quadrado utilizando o algoritmo clássico de Bresenham para desenhar linhas.
 */
private void drawSquare() {
    
    // Calcula as extremidadades finais que devem ser desenhadas
    int x = mouseX + int(wSquare.Text);
    int y = mouseY + int(hSquare.Text);

    // Desenha as quatro linhas para formar o quadrado
    drawLine(mouseX, mouseY, x, mouseY);
    drawLine(x, mouseY, x, y);
    drawLine(x, y, mouseX, y);
    drawLine(mouseX, y, mouseX, mouseY);
}

/** 
 * Desenha uma linha utilizando o algoritmo clássico de Bresenham.
 *
 * Recebe duas cordenadas XY para traçar a reta.
 */
private void drawLine(int x1, int y1, int x2, int y2) {
    int dx = Math.abs(x2 - x1);
    int dy = Math.abs(y2 - y1);
    int sx = (x1 < x2) ? 1 : -1;
    int sy = (y1 < y2) ? 1 : -1;
    int err = dx - dy;
    stroke(int(rSquare.Text), int(gSquare.Text), int(bSquare.Text));
    while (true) {
        point(x1, y1);
        if (x1 == x2 && y1 == y2) {
            break;
        }
        int e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            x1 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y1 += sy;
        }
    }
    stroke(0, 0, 0);
}

/** 
 * Desenha um círculo utilizando o algoritmo clássico de Bresenham.
 */
private void drawCircle() {
    int x = 0;
    int y = int(dCircle.Text) / 2;
    int d = 3 - 2 * y;
    stroke(int(rCircle.Text), int(gCircle.Text), int(bCircle.Text));
    while (x <= y) {
        plotPoints(mouseX, mouseY, x, y);
        if (d < 0) {
            d = d + 4 * x + 6;
        } else {
            d = d + 4 * (x - y) + 10;
            y--;
        }
        x++;
    }
    stroke(0, 0, 0);
}

/** 
 * Desenha na tela os pontos necessários para o desenho do círculo 
 * utilizando o algoritmo clássico de Bresenham.
 */
private void plotPoints(int centerX, int centerY, int x, int y) {
    point(centerX + x, centerY + y);
    point(centerX - x, centerY + y);
    point(centerX + x, centerY - y);
    point(centerX - x, centerY - y);
    point(centerX + y, centerY + x);
    point(centerX - y, centerY + x);
    point(centerX + y, centerY - x);
    point(centerX - y, centerY - x);
}