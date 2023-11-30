//
//  ContentView.swift
//  Pia12nov29
//
//  Created by BillU on 2023-11-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            //Kodtest().kod1(mening: "Att programmera är skoj")
            //Kodtest().kod1(mening: "När jag bygger exempelapplikationer så är koden fin")
            //Kodtest().kod2(tal1: "sju", tal2: "tre", calctype: "plus")
            //Kodtest().kod2(tal1: "två", tal2: "sju", calctype: "multiplikation")
            //Kodtest().kod3(siffror: [2,5,4,6,9,2])
            //Kodtest().kod3(siffror: [1,99,45,23,4,78,3])
            Kodtest().bonuskod()
        }
    }
    
    
}

#Preview {
    ContentView()
}
