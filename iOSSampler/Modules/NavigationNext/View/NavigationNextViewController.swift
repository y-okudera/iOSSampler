//
//  NavigationNextViewController.swift
//  iOSSampler
//
//  Created by stv_okudera on 2020/1/9.
//  Copyright © 2020 stv_okudera. All rights reserved.
//

import UIKit

protocol NavigationNextView: class {
    
}

final class NavigationNextViewController: UIViewController {
    
    var presenter: NavigationNextViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupNavigationBackButton()
    }
}

extension NavigationNextViewController: NavigationNextView {
    
}

// MARK: - Private
extension NavigationNextViewController {
    /// ナビゲーションバーのBackボタンにイベントを登録する
    private func setupNavigationBackButton() {
        addNavigationBackEvent { [weak self] in
            guard let `self` = self else {
                return
            }
            self.confirmWhetherToBack()
        }
    }
    
    private func confirmWhetherToBack() {
        let alert = UIAlertController(
            title: "Confirm".localized,
            message: "Your entries have not been saved.\nAre you sure you want to finish editing?".localized,
            preferredStyle: .alert
        )
        alert.addAction(
            .init(title: "OK", style: .default, handler: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            })
        )
        
        alert.addAction(
            .init(title: "Cancel", style: .cancel)
        )
        present(alert, animated: true)
    }
}
