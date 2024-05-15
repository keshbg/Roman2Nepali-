//
//  CommonButton.swift
//  Roman2Nepali
//
//  Created by Kesh Gurung on 15/05/2024.
//

import Foundation
import SwiftUI

struct CommonButton: View {
    var action: () -> Void
    var label: String
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}
