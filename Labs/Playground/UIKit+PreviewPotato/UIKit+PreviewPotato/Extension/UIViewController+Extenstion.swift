//
//  UIViewController+Extenstion.swift
//  UIKit+PreviewPotato
//
//  Created by Atlas on 2022/04/10.
//

import SwiftUI

#if canImport(SwiftUI) && DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
        }

        func preview() -> some View {
            Preview(viewController: self)
        }
}
#endif
