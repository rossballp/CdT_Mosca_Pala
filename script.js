// Stato evidenziazioni attive all'inizio
const activeTags = {
  placeName: false,
  geogName: false,
  reale: false,
  immaginario: false,
  addName: false,
  opere: false,
  tema: false,
  verbum: false,
  quote: false,
  orgName: false,
  foreign: false,
  publisher: false,
  j: false,
  date: false
};

const hrefmap = {
  placeName: ["#placeNames"],
  geogName: ["#geogNameTags"],
  reale: ["#persNames"],
  immaginario: ["#persNames2"],
  addName: ["#addNames"],
  opere: ["#TitleOp"],
  date: ["#dateTag"],
  tema: ["#rsTags"],
  verbum: ["#rsTag2"],
  quote: ["#citTag"],
  orgName: ["#orgNameTags"],
  foreign: ["#foreignTag"],
  publisher: ["#ediTag"],
  j: ["#rivisteTag"]
};



// funzione per evidenziare i tag usando le classi CSS
function highlightTag(tagType) {
  activeTags[tagType] = !activeTags[tagType];
  const isActive = activeTags[tagType];

  // seleziona i tag nel testo e li evidenzia
  const elements = document.querySelectorAll(`[data-type="${tagType}"], ${tagType}`);

  elements.forEach(el => {
    const className = `tag-${tagType}`;
    if (isActive) {
      el.classList.add(className);
    } else {
      el.classList.remove(className);
    }
  });

  //mantiene lo stato attivo dei link della taglist
  const hrefs = hrefmap[tagType] || [];
  hrefs.forEach(href => {
    const menuLinks = document.querySelectorAll(`.tagList a[href="${href}"]`);
    menuLinks.forEach(link => {
      link.classList.toggle("active", isActive);
    });
  });
}


document.addEventListener("DOMContentLoaded", function () {
  // gestione della mappatura con evidenziazione
  document.querySelectorAll("area").forEach(area => {
    area.addEventListener("click", function (event) {
      event.preventDefault(); // evita lo scroll automatico

      const targetId = this.getAttribute("href").replace("#", "");
      const target = document.getElementById(targetId);

      if (!target) return;

      if (target.classList.contains("evidenzia")) {
        target.classList.remove("evidenzia");
        return;
      }

      // rimuove evidenziazione da altri elementi evidenziati
      document.querySelectorAll(".evidenzia").forEach(el => {
        el.classList.remove("evidenzia");
      });

      // aggiunge evidenziazione alla zona cliccata
      target.classList.add("evidenzia");

      // offset per scroll leggermente sollevato
      const yOffset = -150; 
      const y = target.getBoundingClientRect().top + window.pageYOffset + yOffset;
      
      window.scrollTo({ top: y, behavior: "smooth" });
    });
  });
});

//funzione JQuery per mostrare le correzioni al testo senza aggiornare la pagina
    $(document).ready(function () {
      $("#correzioni").click(function () {
        $(".choice.correzione .sic").toggleClass("hidden visible");
        $(".choice.correzione .corr").toggleClass("hidden visible");
      });
    });
    
    