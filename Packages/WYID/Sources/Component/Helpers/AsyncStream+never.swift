//
//  AsyncStream+never.swift
//  
//
//  Created by 小林聖人 on 2023/03/20.
//

import Foundation

extension AsyncStream {
  static var never: Self {
    Self { _ in }
  }
}
