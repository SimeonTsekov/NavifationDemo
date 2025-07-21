//
//  LogInView.swift
//  NavigationDemo
//
//  Created by Simeon Tsekov on 27.09.23.
//

import SwiftUI
import SafariServices

struct SafariWebView: View {
    @EnvironmentObject var router: ProfileRouter

    var body: some View {
        SafariWebViewWrapper(url: URL(string: "https://google.com")!, router: router)
            .ignoresSafeArea()
            .toolbar(.hidden, for: .navigationBar)
            .toolbar(.hidden, for: .tabBar)
    }
}

struct SafariWebViewWrapper: UIViewControllerRepresentable {
    var url: URL
    var router: ProfileRouter

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        vc.delegate = context.coordinator

        return vc
    }

    func updateUIViewController(_ controller: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariWebViewWrapper>) { }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, router)
    }

    final class Coordinator: NSObject, SFSafariViewControllerDelegate {
        let parent: SafariWebViewWrapper
        let router: ProfileRouter

        init(_ parent: SafariWebViewWrapper, _ router: ProfileRouter) {
            self.parent = parent
            self.router = router
        }

        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            router.clearPath()
        }
    }
}
