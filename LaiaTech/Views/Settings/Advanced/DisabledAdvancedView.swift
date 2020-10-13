//
//  DisabledAdvancedView.swift
//  CameraController
//
//  Created by Itay Brenner on 8/7/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct DisabledAdvancedView: View {
    var body: some View {
        VStack {
            Text("Power Line Frequency (Anti-Flicker)")
            .padding(.bottom, 5.0)
            
            Picker(selection: .constant(0), label: EmptyView()) {
                Text("Disabled").frame(width: 100).tag(0)
                Text("50 Hz").frame(width: 100).tag(1)
                Text("60 Hz").frame(width: 100).tag(2)
                Text("Auto").frame(width: 100).tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 15.0)

            HStack {
                Text("Backlight Compensation")
                Spacer()
                Picker(selection: .constant(0), label: EmptyView()) {
                    Text("Off").tag(0)
                    Text("On").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: SLIDER_WIDTH, height: 20.0)
            }
            .padding(.bottom, 10.0)

            slider("Focus")
            .padding(.bottom, 10.0)
            
            slider("Zoom")
            .padding(.bottom, 10.0)
            
            slider("Pan")
            .padding(.bottom, 10.0)
            
            slider("Tilt")
        }.disabled(true)
    }

    func slider(_ name: String) -> some View {
        HStack {
            Text(name)
            Spacer()
            Slider(value: .constant(0.0), in: 0...1).frame(width: SLIDER_WIDTH, height: 15.0)
        }
    }
}

struct DisabledAdvancedView_Previews: PreviewProvider {
    static var previews: some View {
        DisabledAdvancedView()
    }
}
