
// Stausimulation nach Nagel-Schreckenberg
// ---------------------------------------

// Globale Variablen fürs Modell
float CONST_P        = 0.15;   // Wahrscheinlichkeit fürs Trödeln
float MAXSPEED       = 1.0;    // Höchstgeschwindigkeit der Autos
int   FAHRBAHN       = 100;    // Anzahl der 7,5m Segmente
int   AUTOS          = 20;     // Anzahl der Autos

// Einstellungen für das Aussehen
int   kreisradius    = 250;
int   rand           = 20;
int   fenstergroesse = 2 * (kreisradius + rand);
color langsam        = color(0, 0, 255);
color schnell        = color(255, 0, 0);

// Sonstiges
Auto  auto[] = new Auto[AUTOS];


void setup()
{
    // Das Sketchfenster anpassen
    background(0, 0, 0);
    size(fenstergroesse, fenstergroesse);
    smooth();

    // Ring mit Autos befüllen
    for (int i = 0; i < AUTOS; i++)
    {
        auto[i] = new Auto(i);
    }
}


void draw()
{
    for (int i = 0; i < AUTOS; i++)
    {
        // 1. Beschleunigen
        auto[i].vel = constrain(auto[i].vel + 0.001, 0.0, MAXSPEED);
       
        // 2. Kollisionsfreiheit
        
        // 3. Trödeln
        
        // 4. Fahren
        auto[i].fahren();
        
    }
    
    background(0, 0, 0);
    for (int i = 0; i < AUTOS; i++)
    {
        stroke(lerpColor(langsam, schnell, map(auto[i].vel, 0, MAXSPEED, 0, 1)));
        strokeWeight(3);
        float winkel = auto[i].pos * (TWO_PI / FAHRBAHN);
        point(kreisradius * (1.0 + cos(winkel)) + rand, 
              kreisradius * (1.0 + sin(winkel)) + rand);
    }
}
