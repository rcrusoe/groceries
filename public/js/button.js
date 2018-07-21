(function() {
  const link =  "http://www.recidex.com/import?recipe[link]=" + window.location.href;
  const recidexButton = document.getElementById("recidex-button");
  recidexButton.setAttribute("href", link);
  recidexButton.innerHTML="Save on Recidex";
  recidexButton.style["border"]="2px solid #454853"
  recidexButton.style["border-radius"]="3px"
  recidexButton.style["font-family"]="'Futura PT', sans-serif"
  recidexButton.style["padding"]="10px"
  recidexButton.style["white-space"]="nowrap"
  recidexButton.style["text-decoration"]="none"
  recidexButton.style["font-weight"]="bold"

  recidexButton.addEventListener("click", function(e){
    e.preventDefault()
    let myWindow = window.open(link, "Save on Recidex", "width=550,height=530,top=100,left=200");
    return false;
  });
})();
