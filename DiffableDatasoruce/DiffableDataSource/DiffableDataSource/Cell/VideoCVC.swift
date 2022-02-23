//
//  VideoCVC.swift
//  DiffableDataSource
//
//  Created by Junho Lee on 2022/02/23.
//

import Foundation

import UIKit

class VideoCVC: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
  var video: Video? {
    didSet {
      titleLabel.text = video?.title
      subtitleLabel.text = "\(video?.lessonCount ?? 0) lessons"
    }
  }
}
