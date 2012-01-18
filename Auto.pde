
class Auto
{
    float acc;
    float vel;
    float finalSpeed;
    float pos;
    
    
    Auto(float pos)
    {
        this.acc        = 2.0;  // 2.0 m*s^-2
        this.vel        = 0;
        this.finalSpeed = 37.5; // 135km/h
        this.pos        = pos;
    }
    
    
    void fahren(float dt)
    {
        this.pos += this.vel * dt;
        this.pos  = this.pos % FAHRBAHN;
    }
}
