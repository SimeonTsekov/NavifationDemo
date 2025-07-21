//
//  StockTicker.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import Foundation
import SwiftUI
import UIKit

struct StockTickerView: View {
    var body: some View {
        StockTickerViewControllerWrapper()
            .navigationTitle("SXR8")
            .navigationBarTitleDisplayMode(.inline)
    }
}

class StockTickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "SXR8"
        label.textAlignment = .center

        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

struct StockTickerViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> StockTickerViewController {
        return StockTickerViewController()
    }

    func updateUIViewController(_ uiViewController: StockTickerViewController, context: Context) {
    }
}
