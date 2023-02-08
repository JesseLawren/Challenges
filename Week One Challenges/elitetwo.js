//Stores supermarket items inside an array
const supermarketItems = [
    {name: "Bag of oranges", price: 3.99},
    {name: "Green Onions", price: 0.89 },
    {name: "Artisan Raisin Bread", price: 5.99},
    {name: "Gallon of Spring Water", price: 1.89 },
    {name: "Yuxiang rice wine", price: 4.99},
    {name: "Hoisen sauce", price: 5.99 },
    //..
];

//Stores items the items in the user's cart
let cart = [];

//Displays suggestions whenever the user types in the search box and clears previous suggestions
function search(query) {
    //Refresh
    document.querySelector("#suggestions").innerHTML = "";
    
    //Find suggestions that match the query
    let suggestions = supermarketItems.filter(item => item.name.toLowerCase().includes(query.toLowerCase()));

    //Displays each suggestion and turns it into a button that can be pressed to add it into the cart
    suggestions.forEach(item => {
        let suggestionsElement = document.createElement("li");
        suggestionsElement.innerHTML = `<button onclick="addToCart('${item.name}')">Add to cart</button> ${item.name} (${item.price})`;
        document.querySelector("#suggestions").appendChild(suggestionsElement);
    });
}

//Finds supermarket item inside of array then adds each item and displays each
function addToCart(itemName) {
    //Finds the item inside the supermarket array
    let item = supermarketItems.find(item => item.name === itemName);

    //Adds item
    cart.push(item);

    //Displays each cart item and turns them into individual buttons
    let cartItemElement = document.createElement("li");
    cartItemElement.innerHTML = `<input type="checkbox" onchange="toggleItem('${item.name}')"> ${item.name} (${item.price})`;
    document.querySelector("#cart").appendChild(cartItemElement);
}

//Once a cart item is checked it is found and removed 
function toggleItem(item) {
    //Finds item in cart
    let itemIdex = cart.findIndex(item => item.name === itemName);

    //Removes the item
    cart.splice(itemIndex, 1);

    //Removes item from the display
    let cartItemElement = document.querySelector(`#cart li:nth-child(${itemIndex + 1})`);
    cartItemElement.remove();
}