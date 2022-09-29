//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Junho Lee on 2022/02/23.
//

import UIKit

class VideosViewController: UICollectionViewController {
    // MARK: - Properties
    private var videoList = Video.allVideos
    //    private var sections = Section.allSections
    private lazy var dataSource = makeDataSource()
    private var searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Video>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Video>
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSearchController()
        //    configureLayout()
    }
    
    // MARK: - Functions
    func makeDataSource() -> DataSource {
        // 1
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, video) ->
                UICollectionViewCell? in
                // 2
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "VideoCVC",
                    for: indexPath) as? VideoCVC
                cell?.video = video
                cell?.backgroundColor = .systemGray
                return cell
            })
        return dataSource
    }
    //    func makeDataSource() -> DataSource {
    //        // 1
    //        let dataSource = DataSource(
    //            collectionView: collectionView,
    //            cellProvider: { (collectionView, indexPath, video) ->
    //                UICollectionViewCell? in
    //                // 2
    //                let cell = collectionView.dequeueReusableCell(
    //                    withReuseIdentifier: "VideoCollectionViewCell",
    //                    for: indexPath) as? VideoCollectionViewCell
    //                cell?.video = video
    //                return cell
    //            })
    //        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
    //            guard kind == UICollectionView.elementKindSectionHeader else {
    //                return nil
    //            }
    //            let section = self.dataSource.snapshot()
    //                .sectionIdentifiers[indexPath.section]
    //            let view = collectionView.dequeueReusableSupplementaryView(
    //                ofKind: kind,
    //                withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier,
    //                for: indexPath) as? SectionHeaderReusableView
    //            view?.titleLabel.text = section.title
    //            return view
    //        }
    //        return dataSource
    //    }
    
    // 1
    func applySnapshot(animatingDifferences: Bool = true) {
        // 2
        var snapshot = Snapshot()
        // 3
        snapshot.appendSections([.main])
        // 4
        snapshot.appendItems(videoList)
        // 5
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

// MARK: - UICollectionViewDataSource
//extension VideosViewController {
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return videoList.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let video = videoList[indexPath.row]
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCVC", for: indexPath) as? VideoCVC else { fatalError() }
//        cell.video = video
//        cell.backgroundColor = .systemGray
//        return cell
//    }
//}

// MARK: - UICollectionViewDelegate
extension VideosViewController {
    //  override func collectionView(
    //    _ collectionView: UICollectionView,
    //    didSelectItemAt indexPath: IndexPath
    //  ) {
    //    let video = videoList[indexPath.row]
    //    guard let link = video.link else {
    //      print("Invalid link")
    //      return
    //    }
    //    let safariViewController = SFSafariViewController(url: link)
    //    present(safariViewController, animated: true, completion: nil)
    //  }
}

// MARK: - UISearchResultsUpdating Delegate
extension VideosViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        videoList = filteredVideos(for: searchController.searchBar.text)
        applySnapshot()
        //        applySnapshot()
    }
    
    func filteredVideos(for queryOrNil: String?) -> [Video] {
        let videos = Video.allVideos
        guard
            let query = queryOrNil, !query.isEmpty
        else {
            return videos
        }
        return videos.filter {
            return $0.title.lowercased().contains(query.lowercased())
        }
    }
    
    //    func filteredSections(for queryOrNil: String?) -> [Section] {
    //      let sections = Section.allSections
    //      guard
    //        let query = queryOrNil,
    //        !query.isEmpty
    //        else {
    //          return sections
    //      }
    //
    //      return sections.filter { section in
    //        var matches = section.title.lowercased().contains(query.lowercased())
    //        for video in section.videos {
    //          if video.title.lowercased().contains(query.lowercased()) {
    //            matches = true
    //            break
    //          }
    //        }
    //        return matches
    //      }
    //    }
    //
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Videos"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VideosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 155, height: 57)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

// MARK: - Layout Handling
extension VideosViewController {
      private func configureLayout() {
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
          let isPhone = layoutEnvironment.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.phone
          let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.absolute(isPhone ? 70 : 250)
          )
          let itemCount = isPhone ? 2 : 3
          let item = NSCollectionLayoutItem(layoutSize: size)
          let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: itemCount)
          let section = NSCollectionLayoutSection(group: group)
          section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
          section.interGroupSpacing = 10
          return section
        })
      }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
}

