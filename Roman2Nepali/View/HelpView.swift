//
//  HelpView.swift
//  Roman2Nepali
//
//  Created by Kesh Gurung on 14/05/2024.
//

import SwiftUI

struct HelpView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.title2)
                        .foregroundStyle(.black)
                }
                .padding()
            }
            Text("Tips and Tricks for Roman 2 Nepali Unicode Typing")
                .font(.title3)
                .bold()
            Rectangle()
                .frame(width: 200, height: 1)
            Text("Combine English in Nepali unicode text: Simply put english text inside the {} brackets to remain as English. Example: yo {phone} mero ho. = यो phone मेरो हो")
                .padding()
            Rectangle()
                .frame(width: 200, height: 1)
            Text("Phonetically similar letters in Nepali: ta = त, Ta = ट, tha = थ, Tha = ठ, da = द, Da = ड, dha = ध, Dha = ढ, na = न, Na = ण, sha = श, Sha = ष. the upper or lower case doesn't matter for rest of the Nepali alphabate letters.")
                .padding()
            Rectangle()
                .frame(width: 200, height: 1)
            Text("Use the / to separate for eg: pratishat/ko = प्रतिशतको, Use \\ to cut words at last eg: bas = बस, bas\\ = बस्")
                .padding()
            Spacer()
        }
    }
}

