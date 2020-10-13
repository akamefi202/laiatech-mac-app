//
//  DisabledBasicSettings.swift
//  CameraController
//
//  Created by Itay Brenner on 8/7/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct DisabledBasicSettings: View {
    var body: some View {
        VStack {
            HStack {
                Text("Auto-Exposure Mode")
                Spacer()
                Picker(selection: .constant(0.0), label: EmptyView()) {
                    Text("Manual").tag(1)
                    Text("Auto").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: SLIDER_WIDTH, height: 20.0)
            }.padding(.bottom, 10.0)
            
            slider("Exposure Time", image: "clock").padding(.bottom, 10.0)
            
            slider("Gain", image: "gain").padding(.bottom, 10.0)
            
            slider("Brightness", image: "brightness").padding(.bottom, 10.0)
            
            slider("Contrast", image: "contrast").padding(.bottom, 10.0)
            
            slider("Saturation", image: "saturation").padding(.bottom, 10.0)
            
            slider("Sharpness", image: "sharp").padding(.bottom, 10.0)
            
            slider("Gamma", image: "gamma").padding(.bottom, 10.0)
            
            slider("White Balance", image: "white_balance")
        }
        .disabled(true)
    }

    func slider(_ name: String, image: String) -> some View {
        HStack {
            Image(image)
            .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
            .padding(.trailing, 10.0)
            
            Text(name)
            Spacer()
            Slider(value: .constant(0.0), in: 0...1).frame(width: SLIDER_WIDTH, height: 15.0)
        }
    }
}

struct DisabledBasicSettings_Previews: PreviewProvider {
    static var previews: some View {
        DisabledBasicSettings()
    }
}
