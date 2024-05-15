//
//  CommonTextField.swift
//  Roman2Nepali
//
//  Created by Kesh Gurung on 15/05/2024.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: 100)
            .background(Color(white: 0.7))
            .border(Color.black, width: 1)
    }
}
