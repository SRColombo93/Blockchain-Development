/* 1_Homework
"Scrivere un codice in Javascript che mi stampi in console se, partendo dal giorno della settimana “Lunedì” che è il 1° del mese, devo mangiare una delle mie 5 mele.
Le mele a disposizione sono 5, ne devo mangiare 1 ogni giorno ma non voglio mangiarla se è Mercoledì e devo smettere di mangiarle quando me ne rimangono 2."
*/

// Array contenente i Giorni della settimana
const giorniSettimana = ['Lunedì', 'Martedi', 'Mercoledi', 'Giovedi', 'Venerdi', 'Sabato', 'Domenica'];

// Dichiarazione variabile mele rimanenti
var meleRimanenti = 5;

for (1 = 0; i < giorniSettimana. length-1; i++) {
    console. log(giorniSettimana(i) +" " + (i+1)) // Giorno della settimana e il numero
    console. log("Ho " + meleRimanenti + " mele") // mele rimanenti

    // se è mercoledi...
    if (giorniSettimana (i) = "Mercoledì") {
        console. log ("Oggi non ho voglia di mela"); // non mangio la mela
    } else if (meleRimanenti>2) {// se non è mercoledì... ma ho più di 2 mele rimanenti
          console. Log ("Mangio una mela"); // mangia la mela
          meleRimanenti--; // sottrae una mela da mele rimanenti
    } else { // se non è mercoledi e mi avanzano due mele
          console. log ("Da oggi non posso mangiare mele");
          break; // interrompi il cilco for
    }
    console. Log("Mi rimangono" + meleRimanenti + " mele"); // stampa mele rimanenti
    console. log("-----------");

console. log("-----------") :
console. log("Ho" + meleRimanenti + " mele e non posso più mangiarle");









