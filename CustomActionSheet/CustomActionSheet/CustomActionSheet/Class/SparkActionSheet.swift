//
//  SparkActionSheet.swift
//  CustomActionSheet
//
//  Created by Junho Lee on 2022/02/17.
//

import Foundation
import UIKit

import SnapKit

public enum ActionStyle {
    case `default`
    case cancel
}

// MARK: Action Struct
// addAction에서 Action의 역할을 맡음. 데이터모델.
public struct Action<T> {

    public var enabled: Bool
    public var executeImmediatelyOnTouch = false

    public fileprivate(set) var data: T?
    public fileprivate(set) var style = ActionStyle.default
    public fileprivate(set) var handler: ((Action<T>) -> Void)?

    public init(_ data: T?, style: ActionStyle, handler: ((Action<T>) -> Void)?) {
        enabled = true
        self.data = data
        self.style = style
        self.handler = handler
    }
}

// MARK: - Section class

open class Section<ActionDataType, SectionHeaderDataType> {
    
    open var data: SectionHeaderDataType? {
        get { return _data?.data }
        set { _data = RawData(data: newValue) }
    }
    open var actions = [Action<ActionDataType>]()
    fileprivate var _data: RawData<SectionHeaderDataType>?

    public init() {}
}

// MARK: - Row class

final class RawData<T> {
    var data: T!
    
    init?(data: T?) {
        guard let data = data else { return nil }
        self.data = data
    }
}



/*
open class ActionController<ActionViewType: UICollectionViewCell, ActionDataType, HeaderViewType: UICollectionReusableView, HeaderDataType, SectionHeaderViewType: UICollectionReusableView, SectionHeaderDataType>: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // addAction을 했을 때, section이 존재하면 action 배열에 Action만 추가하고, section이 없으면 section을 새로 만들어준다.
    // addsection은 그냥 새로운 섹션을 만들어주는 것이다. stackView를 하나 추가해주면 된다. empty라고 스타일을 지정하면 빈칸을 만들어주자.
    // 취소 action은 따로 만들어주자. 그래도 클로저를 넣을 수 있게 해주는것도 괜찮아 보인다.
    
    // addAction으로 액션을 추가해준다.
    open func addAction(_ action: Action<ActionDataType>) {
        if let section = _sections.last {
            section.actions.append(action)
        } else {
            let section = Section<ActionDataType, SectionHeaderDataType>()
            addSection(section)
            section.actions.append(action)
        }
    }
    
    // section은 action 사이에 공간을 만들어 준다.
    open func addSection(_ section: Section<ActionDataType, SectionHeaderDataType>) -> Section<ActionDataType, SectionHeaderDataType> {
        _sections.append(section)
        return section
    }
    
    open func dismiss(_ completion: (() -> ())? = nil) {
        disableActions = true
        presentingViewController?.dismiss(animated: true) { [weak self] in
            self?.disableActions = false
            completion?()
        }
    }
    
    // MARK: collectionView 세팅
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
*/
