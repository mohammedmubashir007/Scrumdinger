//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Mohammed Mubashir on 04/06/23.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection : Theme
    var body: some View {
        Picker(selection: $selection) {
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        } label: {
            Text("Theme")
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.indigo))
    }
}
