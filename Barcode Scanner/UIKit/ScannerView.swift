//
//  ScannerView.swift
//  Barcode Scanner
//
//  Created by Mohamed Khater on 02/04/2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding private var barcode: String?
    
    init(barcode: Binding<String?>) {
        self._barcode = barcode
    }
    
    func makeCoordinator() -> Coordinator { Coordinator(barcode: $barcode) }
    
    func makeUIViewController(context: Context) -> ScannerVC {
        return ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        @Binding private var barcode: String?
        
        init(barcode: Binding<String?>) {
            self._barcode = barcode
        }
        
        func didFind(barcode: String) {
            self.barcode = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error)
        }
    }
}
