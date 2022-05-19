//
//  ContentView.swift
//  LaraNotes
//
//  Created by Christian Paulo on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var focusedReleaseID: UUID?
    @State var displayAddReleaseView = false
    @State var report: Report = Report.api

    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                HeaderSale(wallet: report)
                Text("Lançamentos").font(.title2).fontWeight(.bold).padding(.leading)
                VStack(alignment: .leading){
                    releasesList
                }
                
            }.navigationBarTitleDisplayMode(.inline)
            
                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        navigationBarLink
//                    }
                    ToolbarItem(placement: .bottomBar) {
                        bottomBarItemContent
                    }
                }
                .sheet(isPresented: $displayAddReleaseView){
                    AddRelease(isPresented: $displayAddReleaseView, report: $report)
                }
            
        }
        
    }
    
    private var releasesList: some View{
        List(report.reportsByDate, id: \.date) { (date, releases) in
            Section( // Uma sessao para cada dia, ou seja, para cada chave do dicionario
                header: Text(date),
                content: {
                    ForEach(releases) { release in
                        HStack{
                            Text(release.title)
                                .padding(.top, 6)
                                .padding(.bottom, 6)
                            Spacer()
                            Text(release.type == .despesa ? "- \(release.value.formatted(.currency(code: "BRL")))" : "+ \(release.value.formatted(.currency(code: "BRL")))")
                                .foregroundColor(.white)
                                .padding(5)
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(release.type == .despesa ? Color.red : Color.green)
                                }
                        }
                    }
                }
            )
        }
        .listStyle(.plain)
        .padding(.top, -10)
        
    }
    
    private var navigationBarLink: some View {
        HStack{
            NavigationLink(destination: Charts()){
                Image(systemName: "chart.bar.xaxis")
            }
        }
    }
    
    private var bottomBarItemContent: some View {
        HStack {
            Button {
                displayAddReleaseView = true
            } label: {
                Label("Novo Lançamento", systemImage: "plus")
                    .labelStyle(.titleAndIcon)
                    .font(.system(.body, design: .rounded).weight(.medium))
            }
            Spacer()
        }
        .padding(.leading, -10)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(report: .api).preferredColorScheme(.dark).previewDevice("iPhone 13 Pro Max")
            ContentView(report: .api).previewDevice("iPhone 13 Pro Max").previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}

