//
//  ImageView.swift
//  CameraController
//
//  Created by Itay Brenner on 7/24/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var controller: DeviceController

    var body: some View {
        VStack {
            HStack {
                Image("brightness")
                .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
                .padding(.trailing, 10.0)
                    
                Text("Brightness")
                Spacer()
                Slider(value: $controller.brightness.sliderValue,
                        in: controller.brightness.minimum...controller.brightness.maximum)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
                    .disabled(!controller.brightness.isCapable)
            }
            .padding(.bottom, 10.0)
            
            HStack {
                Image("contrast")
                .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
                .padding(.trailing, 10.0)
                    
                Text("Contrast")
                Spacer()
                Slider(value: $controller.contrast.sliderValue,
                        in: controller.contrast.minimum...controller.contrast.maximum)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
                    .disabled(!controller.brightness.isCapable)
            }
            .padding(.bottom, 10.0)
            
            HStack {
                Image("saturation")
                .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
                .padding(.trailing, 10.0)
                    
                Text("Saturation")
                Spacer()
                Slider(value: $controller.saturation.sliderValue,
                        in: controller.saturation.minimum...controller.saturation.maximum)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
                    .disabled(!controller.brightness.isCapable)
            }
            .padding(.bottom, 10.0)
            
            HStack {
                Image("sharp")
                .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
                .padding(.trailing, 10.0)
                    
                Text("Sharpness")
                Spacer()
                Slider(value: $controller.sharpness.sliderValue,
                        in: controller.sharpness.minimum...controller.sharpness.maximum)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
                    .disabled(!controller.brightness.isCapable)
            }
            .padding(.bottom, 10.0)
            
            HStack {
                Image("gamma")
                .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
                .padding(.trailing, 10.0)
                    
                Text("Gamma")
                Spacer()
                Slider(value: $controller.gamma.sliderValue,
                        in: controller.gamma.minimum...controller.gamma.maximum)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
                    .disabled(!controller.brightness.isCapable)
            }
        }
    }
}
