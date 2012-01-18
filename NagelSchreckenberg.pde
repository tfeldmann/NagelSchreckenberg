
// Stausimulation nach Nagel-Schreckenberg
// ---------------------------------------

// Globale Variablen fürs Modell
float CONST_P        = 0.15;    // Wahrscheinlichkeit fürs Trödeln
float FAHRBAHN       = 1000.0;  // Länge der Fahrbahn
int   AUTOS          = 40;      // Anzahl der Autos
float AUTOLAENGE     = 4.0;

// Einstellungen für das Aussehen
int   kreisradius    = 250;
int   rand           = 20;
int   fenstergroesse = 2 * (kreisradius + rand);
color langsam        = color(50, 50, 255);
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
        auto[i] = new Auto(i * AUTOLAENGE );
    }
}


void draw()
{
    float dt = 1.0 / frameRate;
    
    for (int i = 0; i < AUTOS; i++)
    {
        // 1. Beschleunigen
        auto[i].vel = constrain(auto[i].vel + auto[i].acc, 0, auto[i].finalSpeed);
       
        // 2. Kollisionsfreiheit
        float abstand = auto[(i + 1) % AUTOS].pos - auto[i].pos;
        if (abstand < 0)
        {
            abstand += FAHRBAHN;
        }
        if (abstand < auto[i].vel)
        {
            auto[i].vel = abstand;
        }
        
        // 3. Trödeln
        if (random(1) < CONST_P && auto[i].vel > 5)
        {
            auto[i].vel -= 5;
        }
        
        // 4. Fahren
        auto[i].fahren(dt);
        
    }
    
    background(0, 0, 0);
    for (int i = 0; i < AUTOS; i++)
    {
        stroke(lerpColor(langsam, schnell, map(auto[i].vel, 0, auto[i].finalSpeed, 0, 1)));
        strokeWeight(3);
        float winkel = auto[i].pos * (TWO_PI / FAHRBAHN);
        point(kreisradius * (1.0 + cos(winkel)) + rand, 
              kreisradius * (1.0 + sin(winkel)) + rand);
    }
}
