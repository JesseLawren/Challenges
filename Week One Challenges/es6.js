//Allows for manipulation of html elements: searchBtn, pokemonName, and result
const searchBtn = document.getElementById("searchBtn");
const pokemonNameInput = document.getElementById("pokemonName");
const resultDiv = document.getElementById("result");

//Formats name for Poke API
const formatPokemonName = pokemonName => {
  return pokemonName
    .toLowerCase()
    .split(" ")
    .join("-");
};

//Uses ES6 async await to fetch specific pokemon data from API 
const fetchPokemon = async pokemonName => {
  const formattedPokemonName = formatPokemonName(pokemonName);
  const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${formattedPokemonName}`);
  const pokemon = await response.json();
  return pokemon;
};

//Displays pokemon data in div element with the id:result 
//More details can be added starting from line 29
const displayPokemon = async pokemonName => {
  const pokemon = await fetchPokemon(pokemonName);
  resultDiv.innerHTML = `
    <h2>${pokemon.name}</h2>
    <p>Weight: ${pokemon.weight}</p>
    <p>Height: ${pokemon.height}</p>
  `;
};

//Monitors search button for a click event
searchBtn.addEventListener("click", () => {
  const pokemonName = pokemonNameInput.value;
  displayPokemon(pokemonName);
});
