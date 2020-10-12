//
//  ContentView.swift
//  WeSplit
//
//  Created by Sofia Rodriguez Morales on 10/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount = ""
    @State var numberOfPeople = 0
    @State var tipPercentage = 0
    
    let tipsPercentage = [10, 15, 20, 25]
    
    var amountPerPerson : Array<Double> {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipsPercentage[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipAmount = orderAmount / 100 * tipSelection
        let totalAmount = orderAmount + tipAmount
        let totalPerPerson = totalAmount / peopleCount
        return [totalAmount, totalPerPerson]
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Text("The total to pay is \(checkAmount)")
                }
                Section{
                    TextField("Check Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                    }
                }
                Section(header: Text("Select your tip percentage")) {
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipsPercentage.count){
                            Text("\(tipsPercentage[$0]) %")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("The total is")){
                    Text("$\(amountPerPerson[0], specifier:"%.2f")")
                        .bold()
                }
                Section(header: Text("The total per person is")){
                    Text("$\(amountPerPerson[1], specifier:"%.2f")")
                        .bold()
                }
            }
            .navigationTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
