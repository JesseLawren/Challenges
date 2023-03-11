public class Vehicle {
    
    public Integer speed {get; private set;}
    public String name {get; private set;}
    public Integer occupants {get; private set;}
    
    public static final Integer CAPACITY = 1;
        
    public enum Medium {
        LAND,
        AIR,
        WATER
    }
    
    List<Medium> media = new List<Medium>();

    public Vehicle() {
        this('Vehicle', 0, 0);
    }

    public Vehicle(String setName) {
        this(setName, 0, 0);
    }

    public Vehicle(String setName, Integer setSpeed) {
        this(setName, setSpeed, 0);
    }

    public Vehicle(String setName, Integer setSpeed, Integer setOccupants) {
        this.name = setName;
        this.speed = Math.max(setSpeed, 0);
        this.occupants = Math.max(setOccupants, 0);
    }

    public void accelerate(Integer throttleInput) {
        System.debug('The Speed of your vehicle: ' + speed);
        this.speed += throttleInput;
        System.debug('has changed to: ' + speed);
    }

    public abstract void turn();

    public String toString() {
        return 'Your vehicle: ' + name + ' has ' + occupants + ' occupants and is moving at ' + speed + ' mph ' + media;
    }
}
