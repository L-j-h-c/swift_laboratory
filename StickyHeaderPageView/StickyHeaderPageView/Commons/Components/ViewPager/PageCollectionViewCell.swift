//
//  PageCollectionViewCell.swift
//  StickyHeaderPageView
//
//  Created by Junho Lee on 2022/07/05.
//

import UIKit

import SnapKit

class PageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Properties
    public var view: UIView? {
        didSet {
            self.setupUI()
        }
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        guard let view = view else { return }
        
        self.contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
//        view.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        NSLayoutConstraint.activate([
            view.leftAnchor
                .constraint(equalTo: self.contentView.leftAnchor),
            view.topAnchor
                .constraint(equalTo: self.contentView.topAnchor),
            view.rightAnchor
                .constraint(equalTo: self.contentView.rightAnchor),
            view.bottomAnchor
                .constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}
