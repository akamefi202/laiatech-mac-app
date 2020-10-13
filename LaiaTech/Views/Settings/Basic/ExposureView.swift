//
//  ExposureView.swift
//  CameraController
//
//  Created by Itay Brenner on 7/21/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct ExposureView: View {
    @ObservedObject var controller: DeviceController

    var body: some View {
        VStack {
            HStack {
                Text("Auto-Exposure Mode")
                Spacer()
                Picker(selection: $controller.exposureMode.selected, label: EmptyView()) {
                    Text("Manual").tag(UVCBitmapControl.BitmapValue.manual)
                    Text("Auto").tag(UVCBitmapControl.BitmapValue.aperturePriority)
                }
                .disabled(!controller.exposureMode.isCapable)
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: SLIDER_WIDTH, height: 20.0)
            }.padding(.bottom, 10.0)

            HStack {
                Image("clock")
                .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
                .padding(.trailing, 10.0)
                
                Text("Exposure Time")
                Spacer()
                Slider(value: $controller.exposureTime.sliderValue, in:
                    controller.exposureTime.minimum...controller.exposureTime.maximum)
                    .disabled(!optionsEnabled() || !controller.exposureTime.isCapable)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
            }
            .padding(.bottom, 10.0)

            HStack {
                Image("gain")
                .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
                .padding(.trailing, 10.0)
                
                Text("Gain")
                Spacer()
                Slider(value: $controller.gain.sliderValue, in: controller.gain.minimum...controller.gain.maximum)
                    .disabled(!optionsEnabled() || !controller.gain.isCapable)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
            }
        }
    }

    func optionsEnabled() -> Bool {
        return controller.exposureMode.selected == .manual
    }
}

//struct ExposureView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExposureView()
//    }
//}
