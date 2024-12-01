//
//  ContentView.swift
//  Tip Calculator App
//
//  Created by Sharuban Sharu on 12/1/24.
//

import SwiftUI

struct TipCalculatorView: View {
    @State private var totalAmount: String = ""
    @State private var tipPercentage: Double = 0
    
    var calculatedTip: Double {
        let amount = Double(totalAmount) ?? 0
        return amount * tipPercentage / 100
    }
    
    var emojiFace: String {
        switch tipPercentage {
        case 10..<25:
            return "😐" // Neutral face
        case 0..<10:
            return "🙁" // Unhappy face
        default:
            return "😊" // Happy face
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Enter total amount", text: $totalAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            Text("Tip Percentage: \(Int(tipPercentage))%")
                .font(.title2)
            
            Slider(value: $tipPercentage, in: 0...100, step: 5)
                .padding()
            
            Text("Calculated Tip: \(calculatedTip, specifier: "%.2f")")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(emojiFace)
                .font(.system(size: 100))
            
            Spacer()
        }
        .padding()
    }
}

struct TipCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TipCalculatorView()
    }
}





