(function() {
  const link =  "http://www.recidex.com/import?recipe[link]=" + window.location.href
  document.getElementById("recidex-button").setAttribute("href", link);
  document.getElementById("recidex-button").addEventListener("click", function(e){
    e.preventDefault()
    let myWindow = window.open(link, "Save on Recidex", "width=550,height=530,top=100,left=200");
    return false;
  });
})();
