//
//  ContentView.swift
//  WeSplit
//
//  Created by Samuel F. Ademola on 12/15/19.
//  Copyright © 2019 Nomizo. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    // CALCULATION PER PERSON
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    // TOTAL AMOUNT OF THE WHOLE CHECK
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                // AMOUNT & NUMBER OF PEOPLE SECTION
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $numberOfPeople)
                }
                
                // TIP SECTION
                Section (header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percetange", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                // GRAND TOTAL SECTION
                Section (header: Text("Grand Total")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                
                // AMOUNT PER PERSON SECTION
                Section (header: Text("Amount Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
