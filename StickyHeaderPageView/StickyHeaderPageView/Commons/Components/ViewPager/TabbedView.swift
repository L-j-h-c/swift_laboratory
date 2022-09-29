//
//  TabbedView.swift
//  StickyHeaderPageView
//
//  Created by Junho Lee on 2022/06/30.
//

import UIKit

import SnapKit

protocol TabbedViewDelegate: AnyObject {
    func didMoveToTab(at index: Int)
}

class TabbedView: UIView {
    
    enum SizeConfiguration {
        case fillEqually(height: CGFloat, spacing: CGFloat = 0)
        case fixed(width: CGFloat, height: CGFloat, spacing: CGFloat = 0)
        
        var height: CGFloat {
            switch self {
            case let .fillEqually(height, _):
                return height
            case let .fixed(_, height, _):
                return height
            }
        }
    }
    
    // MARK: - Properties
    weak var delegate: TabbedViewDelegate?
    
    public let sizeConfiguration: SizeConfiguration
    public var tabs: [TabItemProtocol] {
        didSet {
            self.collectionView.reloadData()
            self.tabs[currentlySelectedIndex].onSelected()
        }
    }
    private var currentlySelectedIndex: Int = 0
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: "TabCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    init(sizeConfiguration: SizeConfiguration,
         tabs: [TabItemProtocol] = []) {
        
        self.sizeConfiguration = sizeConfiguration
        self.tabs = tabs
        super.init(frame: .zero)
        
        self.setupUI()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    public func moveToTab(at index: Int) {
        self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        
        self.tabs[currentlySelectedIndex].onNotSelected()
        self.tabs[index].onSelected()
        
        self.currentlySelectedIndex = index
    }
    
    // MARK: UI & Layout
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setLayout() {
        self.addSubview(collectionView)
        
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension TabbedView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch sizeConfiguration {
        case let .fillEqually(height, spacing):
            let totalWidth = self.frame.width
            let widthPerItem = (
                totalWidth - (
                    spacing * CGFloat((self.tabs.count + 1))
                )
            ) / CGFloat(self.tabs.count)
            
            return CGSize(width: widthPerItem,
                          height: height)
            
        case let .fixed(width, height, spacing):
            return CGSize(width: width - (spacing * 2),
                          height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch sizeConfiguration {
        case let .fillEqually(_, spacing),
             let .fixed(_, _, spacing):
            
            return spacing
        }
    }
}

extension TabbedView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
        cell.view = tabs[indexPath.row]
        return cell
    }
}

extension TabbedView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.moveToTab(at: indexPath.item)
        self.delegate?.didMoveToTab(at: indexPath.item)
    }
}
