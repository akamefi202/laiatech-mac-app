//
//  WhiteBalanceView.swift
//  CameraController
//
//  Created by Itay Brenner on 7/24/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct WhiteBalanceView: View {
    @ObservedObject var controller: DeviceController

    var body: some View {
        HStack {
            Image("white_balance")
            .resizable().frame(width: 15.0, height: 15.0).scaledToFit()
            .padding(.trailing, 10.0)
                
            Text("White Balance")
            Spacer()
            Slider(value: $controller.whiteBalance.sliderValue,
                   in: controller.whiteBalance.minimum...controller.whiteBalance.maximum)
                .frame(width: SLIDER_WIDTH, height: 15)
                .disabled(controller.whiteBalanceAuto.isEnabled)
        }
    }
}

//struct WhiteBalanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        WhiteBalanceView()
//    }
//}
