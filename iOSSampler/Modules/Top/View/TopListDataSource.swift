//
//  TopListDataSource.swift
//  iOSSampler
//
//  Created by Yuki Okudera on 2020/01/09.
//  Copyright © 2020 YukiOkudera. All rights reserved.
//

import UIKit

final class TopListDataSource: NSObject {
    private(set) var sampleTitles: [String] = [
        "NavigationBackButton event handling".localized,
        "TableView with multiple cell types".localized
    ]
    
    override init() {
        super.init()
    }
    
    init(sampleTitles: [String]) {
        self.sampleTitles = sampleTitles
    }
}

extension TopListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TopTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.titleLabel?.text = sampleTitles[indexPath.row]
        return cell
    }
}
