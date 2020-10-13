//
//  ContentView.swift
//  CameraController
//
//  Created by Itay Brenner on 7/19/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI
import Combine
import AVFoundation

struct SettingsView: View {
    @ObservedObject var manager = DevicesManager.shared

    var body: some View {
        HStack {
            VStack {
                headerView(captureDevice: $manager.selectedDevice).padding(.bottom, 20.0)
                Picker(selection: $manager.selectedDevice, label: EmptyView()) {
                    ForEach(manager.devices, id: \.self) { device in
                        Text(device.name).tag(device as CaptureDevice?)
                    }
                }.padding(.bottom, 20.0)
                tabsView(captureDevice: $manager.selectedDevice).padding(.bottom, 40.0)
                ProfileSelector().frame(height: 75)
            }.onAppear {
                DevicesManager.shared.startMonitoring()
            }.onDisappear {
                DevicesManager.shared.stopMonitoring()
            }
        }
        .frame(width: WINDOW_WIDTH)
        .padding(.all, 30.0)
    }
    
    func headerView(captureDevice: Binding<CaptureDevice?>) -> some View {
        HStack {
            Image("laia_logo").resizable().frame(width: 70.0, height: 30.0).scaledToFit()
            Spacer()
            Button(action: {
                let appDelegate: AppDelegate? = NSApplication.shared.delegate as? AppDelegate
                appDelegate?.window.title = "Camera Preview"
                appDelegate?.setContentView(param: "Preview")
            }) {
                Text("Camera Preview")
                .frame(width: 150)
            }
        }
    }

    func tabsView(captureDevice: Binding<CaptureDevice?>) -> some View {
        if captureDevice.wrappedValue != nil {
            return AnyView(TabsView(captureDevice: captureDevice))
        } else {
            return AnyView(EmptyView())
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
