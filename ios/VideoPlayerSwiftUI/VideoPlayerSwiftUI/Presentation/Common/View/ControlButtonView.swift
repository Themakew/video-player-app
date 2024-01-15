//
//  ControlButtonView.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import SwiftUI

struct ControlButtonView: View {
    @Binding var isSelectedAppearanceEnabled: Bool
    @Binding var isEnabled: Bool

    enum ControlButtonSize {
        case `default`
        case larger
    }

    var selectedButtonIconName: String?
    var size: ControlButtonSize

    let defaultButtonIconName: String
    let buttonAction: () -> Void

    private var buttonSize: CGFloat {
        size == .larger ? 80 : 50
    }

    private var iconSize: CGFloat {
        size == .larger ? 40 : 25
    }

    init(isSelectedAppearanceEnabled: Binding<Bool> = .constant(false),
         isEnabled: Binding<Bool> = .constant(true),
         selectedButtonIconName: String? = nil,
         size: ControlButtonSize = .default,
         defaultButtonIconName: String,
         buttonAction: @escaping () -> Void
    ) {
        self._isSelectedAppearanceEnabled = isSelectedAppearanceEnabled
        self._isEnabled = isEnabled
        self.selectedButtonIconName = selectedButtonIconName
        self.size = size
        self.defaultButtonIconName = defaultButtonIconName
        self.buttonAction = buttonAction
    }

    var body: some View {
        Button(action: {
            if selectedButtonIconName != nil {
                isSelectedAppearanceEnabled = false
            }

            buttonAction()
        }) {
            ZStack(alignment: .center) {
                Circle()
                    .fill(.white.opacity(0.7))
                    .frame(width: buttonSize, height: buttonSize)
                    .shadow(radius: 10)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundColor(.black)
                    }

                if let selectedIcon = selectedButtonIconName, isSelectedAppearanceEnabled {
                    Image(selectedIcon)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                } else {
                    Image(defaultButtonIconName)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
            }
            .opacity(isEnabled ? 1 : 0.5)
        }
        .disabled(!isEnabled)
    }
}

