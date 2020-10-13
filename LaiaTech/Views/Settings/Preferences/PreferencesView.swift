//
//  PreferencesView.swift
//  CameraController
//
//  Created by Itay Brenner on 7/25/20.
//  Copyright © 2020 Itaysoft. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    @ObservedObject var settings = UserSettings.shared

    var body: some View {
        VStack(alignment: .leading) {
            //applicationSettings()
            readSettings().padding(.bottom, 20.0)
            writeSettings()
        }
    }

    fileprivate func applicationSettings() -> some View {
        return GroupBox(label: Text("Application")) {
            HStack {
                VStack(alignment: .leading) {
                    Toggle(isOn: $settings.openAtLogin) {
                        Text("Open at login")
                    }
                }
                Spacer()
            }
        }
    }

    fileprivate func readSettings() -> some View {
        return HStack {
            VStack(alignment: .leading) {
                Text("Read auto settings from webcam").padding(.bottom, 10.0)
                Picker(selection: $settings.readRate, label: EmptyView()) {
                    Text("Disabled").tag(RefreshSettingsRate.disabled)
                    Text("Every 0.5 Seconds").tag(RefreshSettingsRate.halfSecond)
                    Text("Every 1 Second").tag(RefreshSettingsRate.oneSecond)
                    Text("Every 2 Seconds").tag(RefreshSettingsRate.twoSeconds)
                    Text("Every 3 Seconds").tag(RefreshSettingsRate.threeSeconds)
                }
            }
        }
    }

    fileprivate func writeSettings() -> some View {
        VStack(alignment: .leading) {
            Text("Write every settings to webcam").padding(.bottom, 10.0)
            Picker(selection: $settings.writeRate, label: EmptyView()) {
                Text("Disabled").tag(RefreshSettingsRate.disabled)
                Text("Every 0.5 Seconds").tag(RefreshSettingsRate.halfSecond)
                Text("Every 1 Second").tag(RefreshSettingsRate.oneSecond)
                Text("Every 2 Seconds").tag(RefreshSettingsRate.twoSeconds)
                Text("Every 3 Seconds").tag(RefreshSettingsRate.threeSeconds)
            }
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
