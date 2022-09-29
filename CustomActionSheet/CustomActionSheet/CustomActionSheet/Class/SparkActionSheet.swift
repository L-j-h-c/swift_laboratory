////
////  SparkActionSheet.swift
////  CustomActionSheet
////
////  Created by Junho Lee on 2022/02/17.
////
//
//import Foundation
//import UIKit
//
//import SnapKit
//
//open class ActionController<ActionViewType: UICollectionViewCell, ActionDataType, HeaderViewType: UICollectionReusableView, HeaderDataType, SectionHeaderViewType: UICollectionReusableView, SectionHeaderDataType>: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    // addAction을 했을 때, section이 존재하면 action 배열에 Action만 추가하고, section이 없으면 section을 새로 만들어준다.
//    // addsection은 그냥 새로운 섹션을 만들어주는 것이다. stackView를 하나 추가해주면 된다. empty라고 스타일을 지정하면 빈칸을 만들어주자.
//    // 취소 action은 따로 만들어주자. 그래도 클로저를 넣을 수 있게 해주는것도 괜찮아 보인다.
//    
//    // addAction으로 액션을 추가해준다.
//    open func addAction(_ action: Action<ActionDataType>) {
//        if let section = _sections.last {
//            section.actions.append(action)
//        } else {
//            let section = Section<ActionDataType, SectionHeaderDataType>()
//            addSection(section)
//            section.actions.append(action)
//        }
//    }
//    
// actionController.addAction(Action("View Details", style: .default, handler: { action in
// }))
// 
//    // section은 action 사이에 공간을 만들어 준다.
//    open func addSection(_ section: Section<ActionDataType, SectionHeaderDataType>) -> Section<ActionDataType, SectionHeaderDataType> {
//        _sections.append(section)
//        return section
//    }
//    
//    open func dismiss(_ completion: (() -> ())? = nil) {
//        presentingViewController?.dismiss(animated: true) { [weak self] in
//            completion?()
//        }
//    }
//}
//
