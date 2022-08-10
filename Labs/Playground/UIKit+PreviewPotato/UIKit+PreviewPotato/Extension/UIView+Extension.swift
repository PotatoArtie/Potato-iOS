//
//  UIView+Extension.swift
//  UIKit+PreviewPotato
//
//  Created by Atlas on 2022/04/10.
//

import SwiftUI

#if canImport(SwiftUI) && DEBUG
extension UIView {
    private struct Preview: UIViewRepresentable {
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
    }
    
    func preview() -> some View {
        Preview(view: self)
    }
}
#endif
