
//Allows for manipulation of html elements: hobby button and hobbies list
const addBtn = document.getElementById("add-hobby-btn")
const hobbiesList = document.getElementById("hobbies-list")

//Add click functionality to button 
addBtn.addEventListener("click", addHobby)

//Prompts user for input, creates matching list item html element, and appends the input to the preexisting list. 
//Delete on click functionality is also added
function addHobby() 
{
    const hobbyInput = prompt("Please enter a new Hobby:");
    const newHobby = document.createElement("li");
    newHobby.innerHTML = hobbyInput;
    newHobby.addEventListener("click", deleteHobby);
    hobbiesList.appendChild(newHobby);
}

//Delete function
function deleteHobby(e) 
{
    e.target.remove();
}


