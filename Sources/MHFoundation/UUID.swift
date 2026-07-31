//
//  UUID.swift
//  swift-mh
//
//  Created by Malcolm Hall on 16/02/2026.
//
import Foundation

extension UUID {
    public static let zero = UUID(uuid: (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)) // "00000000-0000-0000-0000-000000000000"
}

public protocol UUIDRepresentable: Hashable, Codable, RawRepresentable where RawValue == UUID { }
