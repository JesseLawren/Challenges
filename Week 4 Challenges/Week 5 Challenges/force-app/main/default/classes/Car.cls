public class Car extends Vehicle {
    private Integer steeringRotation;
    private Integer tireRotation;
    private Integer gear { get; private set; }

    public Car(String setName, Integer setSpeed, Integer setOccupants, Integer setSteeringRotation, Integer setTireRotation)
    {
        super(setName, setSpeed, setOccupants);
        this.steeringRotation = setSteeringRotation;
        this.tireRotation = setTireRotation;
        this.media.add(Medium.LAND);
        this.gear = (Integer)Math.ceil(0.4444 * (Math.sqrt(this.speed)));
    }

    public Car(String setName, Integer setSpeed, Integer setOccupants) {
        this(setName, setSpeed, setOccupants, 0, 0);
    }

    public Integer tireRotation {
        get {
            return this.tireRotation;
        }
    }

    public override void accelerate(Integer throttleInput) {
        super.accelerate(throttleInput);
        this.gear = (Integer)Math.ceil(0.4444 * (Math.sqrt(this.speed)));
    }

    public override void Turn(Integer rotation) {
        this.steeringRotation += rotation;
        this.tireRotation += rotation / 16;
    }

}
