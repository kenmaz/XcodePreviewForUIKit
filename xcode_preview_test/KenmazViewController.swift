//
//  KenmazViewController.swift
//  xcode_preview_test
//
//  Created by kenmaz on 2019/10/31.
//  Copyright © 2019 kenmaz. All rights reserved.
//

import UIKit

class KenmazViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let container = UIStackView(arrangedSubviews: [
            ({
                let lbl = UILabel()
                lbl.text = "Hello, Kenmaz"
                lbl.font = UIFont.systemFont(ofSize: 40)
                return lbl
                }()
            ),
            ({
                let body = UILabel()
                body.numberOfLines = 0
                body.text = "今晩わ. Catalina + Xcode11 + Xcode Previewで快適コードレイアウト.さようならxib"
                return body
                }()
            ),
            ({
                let buttons = UIStackView(arrangedSubviews: [
                    ({
                        let btn = UIButton(type: .system)
                        btn.setTitle("ボタン1", for: .normal)
                        btn.layer.borderWidth = 1
                        btn.layer.cornerRadius = 4
                        btn.contentEdgeInsets = .init(top: 4, left: 4, bottom: 4, right: 4)
                        return btn
                        }()
                    ),
                    ({
                        let btn = UIButton(type: .system)
                        btn.setTitle("ボタン2", for: .normal)
                        btn.layer.borderWidth = 1
                        btn.layer.cornerRadius = 4
                        btn.contentEdgeInsets = .init(top: 4, left: 4, bottom: 4, right: 4)
                        return btn
                        }()
                    ),
                ])
                buttons.axis = .horizontal
                buttons.alignment = .fill
                buttons.spacing = 8
                return buttons
                }()
            ),
            ({
                let spacer = UIView()
                spacer.backgroundColor = .green
                return spacer}()
            )
        ])
        container.axis = .vertical
        container.alignment = .center
        container.distribution = .fill
        container.frame = view.bounds
        container.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(container)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct KenmazViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<KenmazViewControllerWrapper>) -> KenmazViewController {
        return KenmazViewController()
    }
    
    func updateUIViewController(_ uiViewController: KenmazViewController, context: UIViewControllerRepresentableContext<KenmazViewControllerWrapper>) {
        uiViewController.view.layoutIfNeeded()
    }
    
    typealias UIViewControllerType = KenmazViewController

}

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            KenmazViewControllerWrapper()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            KenmazViewControllerWrapper()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
    static var platform: PreviewPlatform? = .iOS

}
#endif
