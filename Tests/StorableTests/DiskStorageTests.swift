//
//  DiskStorageTests.swift
//
//
//  Created by Sergejs Smirnovs on 10.11.21.
//

import Encryptable
@testable import Storable
import XCTest

final class DiskStorageTests: XCTestCase {
    let crypto = DataCrypter()
    var sut: Storable!

    func testSuccess() async {
        sut = DiskStorage(crypter: DataCrypter())
        let url = tempUrl()
        do {
            let data = "String".data(using: .utf8)!
            try await sut.store(data, to: url)
            let storedData = try await sut.load(from: url)

            XCTAssertEqual(storedData, data)
        } catch {
            XCTFail("Unexpected error")
        }
    }

    func testKeyNotFound() async {
        sut = DiskStorage(crypter: DataCrypter())
        let url = tempUrl()
        do {
            _ = try await sut.load(from: url)
            XCTFail("Should throw")
        } catch {
            XCTAssertNotNil(error)
        }
    }

    private func tempUrl() -> URL {
        let directory = NSTemporaryDirectory()
        let filename = UUID().uuidString
        return URL(fileURLWithPath: directory).appendingPathComponent(filename)
    }
}
