//
//  DisabledAdjustView.swift
//  CameraController
//
//  Created by MrtDolphin on 21/9/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct DisabledAdjustView: View {
    var body: some View {
        VStack {
            /*
            HStack {
                Text("Backlight Compensation")
                Spacer()
                Picker(selection: .constant(0), label: EmptyView()) {
                    Text("Off").tag(0)
                    Text("On").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: SLIDER_WIDTH, height: 20.0)
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15))
            */
            VStack(spacing: 3.0) {
                slider("Focus")
                    .padding(.bottom, 10.0)
                
                slider("Zoom")
                    .padding(.bottom, 10.0)
                
                slider("Pan")
                    .padding(.bottom, 10.0)
                
                slider("Tilt")
                    .padding(.bottom, 10.0)
            }
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

struct DisabledAdjustView_Previews: PreviewProvider {
    static var previews: some View {
        DisabledAdjustView()
    }
}
