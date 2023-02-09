//Data types: int, string, bool, null, undefined
home = "where I'm from";
myfavNum = 32;
roundEarth = true;
if (!roundEarth){
    print("Brain content" + null)
}

//Declaring variables 
let myNumber = 5;

const GRAVITY = true;

var yourNumber = 10;

//Method
let myObject = {
    objName: "A Name",
    number: 123,
    value: false,
};

let blueF = [30, 40, "sunday"]

let myName = myobject.objName;

//Loops
while (tracker < 5){
    tracker = tracker + 1;
    console.log(tracker);
}

for (let myIterator = 0; myIterator < 10; myIterator++){
    //..
}

for (let key in myObject) {
    console.log(key);
}

for (let value of blueF) {
    console.log(value);
}

//Closure
function operationPicker (a,b) {
    return {
        add() {
            return a + b;
        },
        subtract() {
            return a - b;
        },
        multiply() {
            return a * b;
        },
        divide() {
            return a / b;
        },
    };
}

let counter = function (startingValue) {
    let count = startingValue;
    return function () {
        count ++
        return count;
    };
};
