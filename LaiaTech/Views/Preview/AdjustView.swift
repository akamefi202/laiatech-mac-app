//
//  AdjustmentView.swift
//  CameraController
//
//  Created by MrtDolphin on 21/9/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct AdjustView: View {
    @ObservedObject var controller: DeviceController

    var body: some View {
        VStack(spacing: 3.0) {
            /*
            HStack {
                Text("Backlight Compensation")
                Spacer()
                Picker(selection: $controller.backlightCompensation.sliderValue, label: EmptyView()) {
                    Text("Off").tag(0 as Float)
                    Text("On").tag(1 as Float)
                }
                .disabled(!controller.backlightCompensation.isCapable)
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: SLIDER_WIDTH, height: 20.0)
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15))
            */
            HStack {
                Text("Focus")
                Spacer()
                Slider(value: $controller.focusAbsolute.sliderValue,
                       in: controller.focusAbsolute.minimum...controller.focusAbsolute.maximum)
                    .frame(width: SLIDER_WIDTH, height: 15)
                    .disabled(!controller.focusAbsolute.isCapable)
            }
            .padding(.bottom, 10.0)
            
            HStack {
                Text("Zoom")
                Spacer()
                Slider(value: $controller.zoomAbsolute.sliderValue,
                        in: controller.zoomAbsolute.minimum...controller.zoomAbsolute.maximum)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
                    .disabled(!controller.zoomAbsolute.isCapable)
            }
            .padding(.bottom, 10.0)
            
            HStack {
                Text("Pan")
                Spacer()
                Slider(value: $controller.panTiltAbsolute.sliderValue1,
                       in: controller.panTiltAbsolute.minimum1...controller.panTiltAbsolute.maximum1)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
                    .disabled(!controller.panTiltAbsolute.isCapable)
            }
            .padding(.bottom, 10.0)
            
            HStack {
                Text("Tilt")
                Spacer()
                Slider(value: $controller.panTiltAbsolute.sliderValue2,
                       in: controller.panTiltAbsolute.minimum2...controller.panTiltAbsolute.maximum2)
                    .frame(width: SLIDER_WIDTH, height: 15.0)
                    .disabled(!controller.panTiltAbsolute.isCapable)
            }
            .padding(.bottom, 10.0)
        }
    }
}

//struct OrientationView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrientationView()
//    }
//}

