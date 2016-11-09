class Noda{

  private int id;
  private float mass;
  private ArrayList<Noda> adjacents;
  private ArrayList<Float> naturalSpringLengths;
  private float x;
  private float y;
  private float diameter;
  private float velocityX;
  private float velocityY;
  private boolean isHighlighted;
  private PFont font;

    Noda(int id, float mass){
    this.id = id;
    this.mass = mass;
    this.adjacents = new ArrayList<Noda>();
    this.naturalSpringLengths = new ArrayList<Float>();

    this.set(-1.0f, -1.0f, -1.0f); //ad-hoc
    this.setVelocities(0.0f, 0.0f);
    this.isHighlighted = false;
    this.font = createFont("blanch_condensed.ttf", 50);
  }

    void add(Noda adjacent, float naturalSpringLength){
    this.adjacents.add(adjacent);                       //the order of elements in the two ArrayLists must be the same.
    this.naturalSpringLengths.add(naturalSpringLength); //better to capture these as like key-value pairs...
  }
    void set(float x, float y){
    this.x = x;
    this.y = y;
  }
    void set(float x, float y, float diameter){
    this.set(x, y);
    this.diameter = diameter;
  }
    void setVelocities(float velocityX, float velocityY){
    this.velocityX = velocityX;
    this.velocityY = velocityY;
  }

    int getID(){
    return this.id;
  }
    float getMass(){
    return this.mass;
  }
    float getX(){
    return this.x;
  }
    float getY(){
    return this.y;
  }
    float getDiameter(){
    return this.diameter;
  }
    float getVelocityX(){
    return this.velocityX;
  }
    float getVelocityY(){
    return this.velocityY;
  }
    int getSizeOfAdjacents(){
    return this.adjacents.size();
  }
    Noda getAdjacentAt(int index){
    return this.adjacents.get(index);
  }
    float getNaturalSpringLengthAt(int index){
    return this.naturalSpringLengths.get(index);
  }

    void draw(){
    if(this.isHighlighted){
      stroke(255, 118, 0);
      fill( 10);
     }else{
      fill( 0);
      stroke(255, 131, 0);
    }
    ellipse(this.x, this.y, this.diameter, this.diameter);

    if(this.isHighlighted){ //tooltip
      fill(255);
      textFont(this.font, 20);
      textAlign(CENTER, BOTTOM);
      text("id: " + this.id, this.x, this.y);
      textAlign(CENTER, TOP);
      text("mass: " + this.mass, this.x, this.y);
    }
  }

    void highlight(){
    this.isHighlighted = true;
  }
    void dehighlight(){
    this.isHighlighted = false;
  }
 public boolean isIntersectingWith(int x, int y){
    float r = this.diameter / 2.0f;
    if(this.x - r <= x && x <= this.x + r && this.y - r <= y && y <= this.y + r)
      return true;
    else
      return false;
  }

  //@Override
    String toString(){
    String adjacentIDsAndNaturalLengths = "[";
    for(int i = 0; i < this.adjacents.size(); i++)
      adjacentIDsAndNaturalLengths += this.adjacents.get(i).getID() + "(" + this.naturalSpringLengths.get(i) + "),";
    adjacentIDsAndNaturalLengths += "]";
    return "ID:" + this.id +
           ",MASS:" + this.mass +
           ",ADJACENTS(NATURAL_LEGTH):" + adjacentIDsAndNaturalLengths +
           ",X:" + this.x +
           ",Y:" + this.y +
           ",DIAMETER:" + this.diameter +
           ",HIGHLIGHTED:" + this.isHighlighted;
  }

}