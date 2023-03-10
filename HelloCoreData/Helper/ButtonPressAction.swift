//
//  ButtonPressAction.swift
//  HelloCoreData
//
//  Created by Denisa on 30/01/23.
//

import Foundation
import SwiftUI

struct ButtonPressed: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({_ in
                    onPress()
                })
                .onEnded({_ in
                    onRelease()
                })
            )
    }
}

extension View {
    func pressEvents(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(ButtonPressed(onPress: {onPress ()}, onRelease: {onRelease ()}))
    }
}
