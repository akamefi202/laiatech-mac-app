//
//  Preview.swift
//  CameraController
//
//  Created by MrtDolphin on 21/9/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI
import Combine
import AVFoundation

struct Preview: View {
    @ObservedObject var manager = DevicesManager.shared

    var body: some View {
        HStack {
            VStack {
                headerView(captureDevice: $manager.selectedDevice)
                    .padding(.bottom, 30.0)
                
                cameraPreview(captureDevice: $manager.selectedDevice)
                    .padding(EdgeInsets(top: 0, leading: 30.0, bottom: 30.0, trailing: 30.0))
                
                adjustView(captureDevice: $manager.selectedDevice)
                    .padding(EdgeInsets(top: 0, leading: 30.0, bottom: 30.0, trailing: 30.0))
                
                Button(action: {
                    self.manager.selectedDevice?.controller?.resetDefault()
                }) {
                    Text("Set to default").frame(width: 200)
                }
            }.onAppear {
                DevicesManager.shared.startMonitoring()
            }.onDisappear {
                DevicesManager.shared.stopMonitoring()
            }
        }
        .frame(width: WINDOW_WIDTH)
        .padding(.all, 30.0)
        //.background(BACK_COLOR)
        //.foregroundColor(FORE_COLOR)
    }
    
    func headerView(captureDevice: Binding<CaptureDevice?>) -> some View {
        HStack {
            Image("laia_logo").resizable().frame(width: 70.0, height: 30.0).scaledToFit()
            Spacer()
            Button(action: {
                let appDelegate: AppDelegate? = NSApplication.shared.delegate as? AppDelegate
                appDelegate?.window.title = "Camera Settings"
                appDelegate?.setContentView(param: "Settings")
            }) {
                Text("Camera Settings")
                .frame(width: 150)
            }
        }
    }
    
    func cameraPreview(captureDevice: Binding<CaptureDevice?>) -> AnyView {
        if captureDevice.wrappedValue != nil {
            return AnyView(CameraPreview(captureDevice: captureDevice)
                .background(Color.black)
                .frame(height: 300))
        } else {
            return AnyView(Image("video.slash")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, idealHeight: 300)
                .background(Color.init(red: 117 / 255, green: 148 / 255, blue: 255 / 255)))
        }
    }
    
    func adjustView(captureDevice: Binding<CaptureDevice?>) -> AnyView {
        if captureDevice.wrappedValue != nil {
            let captureDevice1: CaptureDevice? = captureDevice.wrappedValue
            
            if let controller = captureDevice1?.controller {
                return AnyView(AdjustView(controller: controller))
            } else {
                return AnyView(DisabledAdjustView())
            }
        } else {
            return AnyView(EmptyView())
        }
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

