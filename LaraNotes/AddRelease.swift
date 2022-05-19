//
//  Header.swift
//  LaraNotes
//
//  Created by Christian Paulo on 12/05/22.
//

import SwiftUI



struct AddRelease: View {
    
    // Pra chamar o add do report, tu vai precisar ter um @Binding, ou alguma maneira de referenciar o report aqui
    @Binding var isPresented: Bool
    @Binding var report: Report
    @State var title : String = ""
    @State var value : Double = 0.0
    
    @State private var selectedFlavor: Flavor = .despesa
    
    @State private var buy = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Título"){
                        TextField("Adicionar titulo", text: $title)
                    }
                    Section("Valor"){
                        TextField("R$0,00", value: $value, format: .currency(code: Locale.current.currencyCode ?? "BRL"))
                            .keyboardType(.numberPad)
                    }
                    Section(){
                        Picker("Tipo de Lançamento", selection: $selectedFlavor) {
                            ForEach(Flavor.allCases) { flavor in
                                Text(flavor.rawValue.capitalized)
                            }
                        }
                    }
                    DatePicker(selection: $buy,
                               in: ...Date(),
                               displayedComponents: .date,
                               label: {
                        Text("Data do Lançamento")
                    })
                    
                    
                }
                .listStyle(.insetGrouped)
                .padding(.top, -20)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Spacer()
                        
                        Button {
                            report.add(release: Release(title: title, type: selectedFlavor, value: value, date: buy))
                            isPresented = false
                        } label: {
                            Text("Salvar")
                                .font(.system(.body, design: .rounded).weight(.medium))
                        }
                        
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button {
                            isPresented = false
                        } label: {
                            Text("Cancelar")
                                .font(.system(.body, design: .rounded).weight(.medium))
                        }
                        
                    }
                }
            }
            .navigationTitle("Novo Lançamento")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}
//
//struct AddRelease_Previews: PreviewProvider {
//    static var previews: some View {
////        AddRelease(isPresented: isPer)
//    }
//}
