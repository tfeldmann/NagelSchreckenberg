// Nagel-Schreckenberg Modell
// --------------------------

// Modell
int freierPlatz = -1;
int ring[]      = new int[3600];

// Umgebung
int kreisradius    = 250;
int rand           = 20;
int fenstergroesse = 2 * kreisradius + 2 * rand;

void setup()
{
    // Fenstereigenschaften
    background(0, 0, 0);
    size(fenstergroesse, fenstergroesse);
    smooth();
    
    // Ring mit Autos befüllen
    for (int i = 0; i < ring.length; i++)
    {
        // Generiert mehr leere Plätze als Autos        
        ring[i] = (int(random(100)) == 0) ? 1 : freierPlatz;
    }
}

void update()
{

}

void draw()
{
    update();
    
    // Zeichnen
    background(0, 0, 0);
    stroke(255, 255, 255);
    strokeWeight(4);
    for (int i = 0; i < ring.length; i++)
    {
        if (ring[i] != freierPlatz)
        {
            float winkel = winkelDerPosition(i);
            point(kreisradius * (1.0 + cos(winkel)) + rand,
                  kreisradius * (1.0 + sin(winkel)) + rand);
        }
    }
}

float winkelDerPosition(int p)
{
    return radians(p * (360.0 / ring.length));
}

int naechstePosition(int p)
{
    return (p == ring.length - 1) ? 0 : p + 1;
}

