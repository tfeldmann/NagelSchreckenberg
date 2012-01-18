
class Auto
{
    float vel;
    float pos;
    
    
    Auto(float pos)
    {
        this.vel = 0;
        this.pos = pos;
    }
    
    
    void fahren()
    {
        this.pos += this.vel;
        this.pos  = this.pos % FAHRBAHN;
    }
}
