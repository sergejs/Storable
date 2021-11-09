//
//  MemoryStorage.swift
//
//
//  Created by Sergejs Smirnovs on 09.11.21.
//

import Foundation

public final class MemoryStorage: Storable {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public func store(
        _ data: Data,
        to url: URL
    ) async throws {
        storage[url] = data
    }

    public func load(
        from url: URL
    ) async throws -> Data? {
        if let data = storage[url] {
            return data
        }
        return nil
    }

    // MARK: Private

    private var storage: [URL: Data?] = [:]
}
