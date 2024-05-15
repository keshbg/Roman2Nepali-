//
//  RomanToNepaliViewModel.swift
//  Roman2Nepali
//
//  Created by Kesh Gurung on 15/05/2024.
//

import Foundation
import SwiftUI
import Combine

protocol RomanToNepaliProtocol {
    
}

class RomanToNepaliViewModel: ObservableObject {
    
    @Published var romanText: String = ""
        @Published var nepaliText: String = ""
        
        init() {
            // Subscribe to changes in the Roman text
            $romanText
                .sink { [weak self] romanText in
                    // Convert the Roman text to Nepali Unicode
                    self?.convertToNepali(romanText)
                }
                .store(in: &cancellables)
        }
        
        private var cancellables = Set<AnyCancellable>()
        
        private func convertToNepali(_ text: String) {
            // Convert each character of the Roman text to Nepali Unicode
                   let convertedText = text.map { character -> String in
                       let characterString = String(character)
                       if let nepaliCharacter = romanToNepaliMap[characterString] {
                           return nepaliCharacter
                       } else {
                           return characterString
                       }
                   }.joined()
                   
                   // Update the Nepali text
                   nepaliText = convertedText
        }
}
