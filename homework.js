// array week days
var giorni_settimana = ["Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"];

// apple variable
var mele = 5;

for (i = 0; i < giorni_settimana.length; i++) {
    console.log(giorni_settimana[i] + " " + (i +1)) // giorno della settimana e il numero
    console.log("Ho " + mele + " mele"); // mele rimanenti

    if (giorni_settimana[i] == "Mercoledì"){
        console.log("Oggi non ho voglia di mela") // se è mercoledì allora non mangio la mela
    } else if (mele > 2) {
        console.log("Mangio una mela"); // se non è mercoledì ma ho più di due mele mangio una mela
        mele--; 
    } else {
        console.log("Da oggi non posso mangiare mele"); // se ho due mele allora non mangio nessuna mela
        break // interrompo il ciclo for
    }

    console.log("Mi rimangono " + mele + " mele"); // stampo quante mele mi rimangono
    console.log("---------------------------------"); // semplice divisore
}

console.log("---------------------------------");
console.log("Ho " + mele + " e mele e non posso più mangiarle");
