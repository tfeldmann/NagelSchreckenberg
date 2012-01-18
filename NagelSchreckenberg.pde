// Nagel-Schreckenberg Modell
// --------------------------

// Modell
int FREI           = -1;          // Alle Werte >-1 geben eine Geschwindigkeit an
int MAXSPEED       = 10;
int ring[]         = new int[16];

// Aussehen
int kreisradius    = 250;
int rand           = 20;
int fenstergroesse = 2 * kreisradius + 2 * rand;


void setup()
{
    // Fenstereigenschaften
    background(0, 0, 0);
    size(fenstergroesse, fenstergroesse);
    stroke(255, 255, 255);
    strokeWeight(4);
    smooth();
    frameRate(2);
    
    // Ring mit Autos befüllen
    for (int i = 0; i < ring.length; i++)
    {
        // Generiert mehr leere Plätze als Autos        
        // ring[i] = (int(random(100)) == 0) ? 1 : FREI;
        ring[i] = (i == 1 || i == 3 || i == 5) ? 1 : FREI;
    }
}


void update()
{
    for (int i = 0; i < ring.length; i++)
    {
        if (ring[i] != FREI)
        {
            // 1. Beschleunigen
            
            // 2. Bremsen
            
            // 3. Trödeln
            
            // 4. Fahrzeuge fortbewegen
            int neuerPlatz   = naechstePos(i, ring[i]);
            ring[neuerPlatz] = ring[i];
            ring[i]          = FREI;
            i                = (neuerPlatz < i) ? i : neuerPlatz;
        }
    }
}


void draw()
{
    background(0, 0, 0);
    for (int i = 0; i < ring.length; i++)
    {
        if (ring[i] != FREI)
        {
            float winkel = winkelDerPosition(i);
            point(kreisradius * (1.0 + cos(winkel)) + rand, 
            kreisradius * (1.0 + sin(winkel)) + rand);
        }
    }

    update();
}


float winkelDerPosition(int p)
{
    return radians(p * (360.0 / ring.length));
}


int naechstePos(int pos, int delta)
{
    return (pos + delta > ring.length - 1) ? delta - (ring.length - pos) : pos + delta;
}

void fortbewegen()
{

}

