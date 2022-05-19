//
//  HeaderSale.swift
//  LaraNotes
//
//  Created by Christian Paulo on 13/05/22.
//

import SwiftUI

struct HeaderSale: View {
    let wallet : Report
    var body: some View {
        Image("Big Sur")
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .clipped()
            .overlay{
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.regularMaterial)
                        .padding(.horizontal)
                        .padding(.vertical)
                    
                    VStack(spacing: 5){
                        Text("Saldo Disponível").font(.callout)
                        Text("\(wallet.calculate.formatted(.currency(code: "BRL")))").font(.largeTitle).fontWeight(.bold)
                    }
                }

            }
    }
}

struct HeaderSale_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSale(wallet: .api).preferredColorScheme(.dark).previewDevice("iPhone 13 Pro Max")
    }
}
