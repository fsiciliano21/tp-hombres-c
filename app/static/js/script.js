const act1 = document.getElementById("prox_1");
const act2 = document.getElementById("prox_2");
const act3 = document.getElementById("prox_3");
window.onload = () =>{
    act1.addEventListener('click', prox);
    act2.addEventListener('click', prox);
    act3.addEventListener('click', prox);
}
function prox() {
    alert("proximamente");
}