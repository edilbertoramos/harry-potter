//
//  ServiceResult.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 03/05/25.
//

import Foundation

public typealias ServiceResult<T> = (data: Data, result: Result<T, ServiceError>)
