//
//  Kodtest.swift
//  Pia12nov29
//
//  Created by BillU on 2023-11-29.
//

import Foundation

class Kodtest {
    
    /*
     Gör så funktionen som tar emot en mening och printar ut ett ord per rad.
     Runt hela ska det vara ram av stjärnor som anpassas efter längst ordet.
     Exempel:
     kod1("Att programmera är skoj")
     Så printa ut följande i loggen.
     ***************
     * Att         *
     * programmera *
     * är          *
     * skoj        *
     ***************
    */
    func kod1(mening : String) {
        // Gör om mening till lista med ord
        // Hitta längsta ordet
        // Printa stjärnor som längsta ord + lite
        // Loopa igenom och printa ord + mellanslag som saknas
        

        // Gör om mening till lista med ord
        var allwords = mening.split(separator: " ")
        
        // Hitta längsta ordet
        var longestword = ""
        for word in allwords {
            if word.count > longestword.count {
                longestword = String(word)
            }
        }
                
        // printa rad med stjärnor lika långt som längsta ordet + 4
        var starrow = ""
        
        for i in 0...longestword.count + 4 {
            starrow = starrow + "*"
        }
        print(starrow)
        
        // loopa ord - print stjärna, mellanslag, ord, massa mellanslag + stjärna
        
        for word in allwords {
            var wordrow = ""
            wordrow = "* "
            wordrow = wordrow + word
            for i in word.count...longestword.count {
                wordrow = wordrow + " "
            }
            wordrow = wordrow + " *"
            print(wordrow)
        }
        
        
        // samma rad med stjärnor igen
        print(starrow)
    }

    /*
     Gör så funktionen tar emot två tal och räknesätt som strings och printar ut resultatet.
     Exempel:
     kod2(tal1: "sju", tal2: "tre", calctype: "plus")
     Ska ta 7 + 3 och printa ut "10"
     Behöver bara ha stöd för tal upp till 10
     */
    func kod2(tal1 : String, tal2 : String, calctype: String) {
        // Gör om text till siffra så som tre -> 3
        // Om calctype = plus gör plus osv.
        // printa resultat
        
        let siffror = ["noll", "ett", "två", "tre", "fyra", "fem", "sex", "sju", "åtta", "nio", "tio"]
        
        var numb1 = siffror.firstIndex(of: tal1)
        var numb2 = siffror.firstIndex(of: tal2)

        if numb1 == nil || numb2 == nil {
            print("Fel siffra")
            return
        }
        
        if calctype == "plus" {
            print(numb1! + numb2!)
        }
        if calctype == "minus" {
            print(numb1! - numb2!)
        }
        if calctype == "multiplikation" {
            print(numb1! * numb2!)
        }

    }

    /*
     Gör så funktionen tar emot en array av tal. Låt den printa ut summan av högsta och lägsta siffran.
     Exempel:
     kod3(siffror: [2,5,4,6,9,2])
     Ska ta 2+9 och printa 11
     */
    func kod3(siffror: [Int]) {
        
        /*
        var largestnumber = 0
        for numb in siffror {
            if numb > largestnumber {
                largestnumber = numb
            }
        }
        print(largestnumber)
        */
        
        /*
        var sortedSiffror = siffror.sorted()
        print(sortedSiffror.last! + sortedSiffror.first!)
        */
        
        
        print(siffror.sorted().first! + siffror.sorted().last!)
    }


    /*
    Bonus:
    Skapa Person objekt som innehåller år född och år död. Låt den innehålla två andra Person objekt för föräldrar.
    Skapa ett påhittat släktträd med personer och ta reda på vem som levt längst.
    */
    
    
    /*
    
    
    4Dagny   5Erik     6Fredrika   7Göran
        \      /        \        /
            2Berit          3Caesar
                \           /
                    1Arne
     
    */
    
    func bonuskod() {
        
        var p1 = Person()
        p1.name = "Arne"
        p1.yearborn = 2017
        
        var p2 = Person()
        p2.name = "Berit"
        p2.yearborn = 1995

        var p3 = Person()
        p3.name = "Caesar"
        p3.yearborn = 1993

        var p4 = Person()
        p4.name = "Dagny"
        p4.yearborn = 1956
        p4.yeardead = 2022

        var p5 = Person()
        p5.name = "Erik"
        p5.yearborn = 1962

        var p6 = Person()
        p6.name = "Fredrika"
        p6.yearborn = 1961

        var p7 = Person()
        p7.name = "Göran"
        p7.yearborn = 1943
        p7.yeardead = 2003

        var p8 = Person()
        p8.name = "Xerxes"
        p8.yearborn = 1742
        p8.yeardead = 1984

        
        p1.parent1 = p2
        p1.parent2 = p3

        p2.parent1 = p4
        p2.parent2 = p5

        p3.parent1 = p6
        p3.parent2 = p7
        
        p7.parent1 = p8
        
        print(p1.livelongest())
        
    }
    
}

class Person {
    
    var name = ""
    
    var yearborn = 0
    var yeardead : Int? = nil
    
    var parent1 : Person? = nil
    var parent2 : Person? = nil

    func oldestyearborn() -> Int {
        
        var oldyear = yearborn
        
        print(name + " " + String(oldyear))
        
        if let par1 = parent1 {
            if par1.oldestyearborn() < oldyear {
                oldyear = par1.oldestyearborn()
            }
        }
        if let par2 = parent2 {
            if par2.oldestyearborn() < oldyear {
                oldyear = par2.oldestyearborn()
            }
        }

        return oldyear
        
    }
    
    func livelongest() -> Int {
        
        var life = 0
        if let whendead = yeardead {
            life = yeardead! - yearborn
        }
        
        print(name + " " + String(life))
        
        if let par1 = parent1 {
            if par1.livelongest() > life {
                life = par1.livelongest()
            }
        }
        if let par2 = parent2 {
            if par2.livelongest() > life {
                life = par2.livelongest()
            }
        }
        
        return life
    }
    
}
