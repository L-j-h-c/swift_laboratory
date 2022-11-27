//
//  main.swift
//  TerminalProjectForAPICall
//
//  Created by Junho Lee on 2022/11/27.
//

import Foundation

import RxSwift

print("Hello, World!")

let disposeBag = DisposeBag()
let service = DefaultKakaoService.shared

service.postStart(scenario: 1)
    .subscribe(onNext: { entity in
        print(entity)
    }).disposed(by: disposeBag)

RunLoop.main.run()
