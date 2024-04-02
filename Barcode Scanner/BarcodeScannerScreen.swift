//
//  BarcodeScannerScreen.swift
//  Barcode Scanner
//
//  Created by Mohamed Khater on 02/04/2024.
//

import SwiftUI

struct BarcodeScannerScreen: View {
    
    @State private var barcode: String? = nil
    @State private var isAlertShow = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(barcode: $barcode)
                    .frame(width: .infinity, height: 300)
                    .padding(.bottom)
                    .overlay(.gray)
                
                VStack(spacing: 18) {
                    Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                        .font(.title)
                    
                    Text(barcode ?? "Not Yet Scanned")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle((barcode == nil) ? .red : .green)
                    
                    Button("Alert") {
                        isAlertShow.toggle()
                    }
                }
            }
            .navigationTitle("Barcode Scanner")
            .alert("Test", isPresented: $isAlertShow) {}
        }
    }
}

#Preview {
    BarcodeScannerScreen()
}
