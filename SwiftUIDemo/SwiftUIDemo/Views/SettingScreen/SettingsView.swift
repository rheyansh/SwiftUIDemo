//
//  SettingView.swift
//  SwiftUIDemo
//
//  Created by raj.sharma on 16/07/19.
//  Copyright © 2019 raj.sharma. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notifications settings")) {
                    Toggle(isOn: $settings.isNotificationEnabled) {
                        Text("Notification:")
                    }
                }
                
                Section(header: Text("Sleep tracking settings")) {
                    Toggle(isOn: $settings.isSleepTrackingEnabled) {
                        Text("Sleep tracking:")
                    }
                    
                    Picker(
                        selection: $settings.sleepTrackingMode,
                        label: Text("Sleep tracking mode")
                    ) {
                        ForEach(SettingsStore.SleepTrackingMode.allCases.identified(by: \.self)) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    
                    Stepper(value: $settings.sleepGoal, in: 6...12) {
                        Text("Sleep goal is \(settings.sleepGoal) hours")
                    }
                }
                
                if !settings.isPro {
                    Section {
                        Button(action: {
                            self.settings.unlockPro()
                        }) {
                            Text("Unlock PRO")
                        }
                        
                        Button(action: {
                            self.settings.restorePurchase()
                        }) {
                            Text("Restore purchase")
                        }
                    }
                }
                }
                .navigationBarTitle(Text("Settings"))
        }
    }
}

#if DEBUG
struct SettingsView_Previews : PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingsStore())
    }
}
#endif
