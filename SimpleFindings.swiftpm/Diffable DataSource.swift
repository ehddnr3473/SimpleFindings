//
//  Custom Identifiers.swift
//  SimpleFindings
//
//  Created by 김동욱 on 2022/12/28.
//

import Foundation
import UIKit

enum Section: CaseIterable {
    case main
}

// Custom Identifiers
struct MyModel: Hashable {
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func ==(lhs: MyModel, rhs: MyModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

// dataSource
let dataSource = UICollectionViewDiffableDataSource<Section, MyModel>(...)

// Empty snapshot
let snapshot = NSDiffableDataSourceSnapshot<Section, UUID>()

// Current data source snapshot copy
let snapshot = dataSource.snapshot()

// IndexPath-based APIs
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let identifier = dataSource.itemIdentifier(for: indexPath) {
        // Do something
    }
}


