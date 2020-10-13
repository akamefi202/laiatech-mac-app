//
//  FocusView.swift
//  CameraController
//
//  Created by Itay Brenner on 7/25/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct FocusView: View {
    @ObservedObject var controller: DeviceController

    var body: some View {
        HStack {
            Text("Focus")
            Spacer()
            Slider(value: $controller.focusAbsolute.sliderValue,
                   in: controller.focusAbsolute.minimum...controller.focusAbsolute.maximum)
                .frame(width: SLIDER_WIDTH, height: 15)
                .disabled(!controller.focusAbsolute.isCapable)
        }
    }
}

//struct FocusView_Previews: PreviewProvider {
//    static var previews: some View {
//        FocusView()
//    }
//}
