//
//  FlyingNumber.swift
//  memorize
//
//  Created by Nima Beig Mohammadi on 14.03.25.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
