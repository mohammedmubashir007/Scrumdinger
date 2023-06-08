//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Mohammed Mubashir on 01/06/23.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums : [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingScrumView = false
    
    let saveAction :()-> Void
    var body: some View {
        NavigationStack{
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                    
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    isPresentingScrumView = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingScrumView)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                saveAction()
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
