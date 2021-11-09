@testable import Storable
import XCTest

final class MemoryStorageTests: XCTestCase {
    var sut: Storable!

    func testEmptyDataSuccess() async {
        sut = MemoryStorage()
        do {
            let data = Data()
            try await sut.store(data, to: URL(string: "key")!)
            let storedData = try await sut.load(from: URL(string: "key")!)

            XCTAssertEqual(data, storedData)
        } catch {
            XCTFail("Unexpected error")
        }
    }

    func testCorrectDataSuccess() async {
        sut = MemoryStorage()
        do {
            let data = "Data()".data(using: .utf8)!
            try await sut.store(data, to: URL(string: "key")!)
            let storedData = try await sut.load(from: URL(string: "key")!)

            XCTAssertEqual(data, storedData)
        } catch {
            XCTFail("Unexpected error")
        }
    }

    func testCodableDataSuccess() async {
        sut = MemoryStorage()
        do {
            let data = "Data()"
            try await sut.encode(data, to: URL(string: "key")!)
            let storedData: String? = try await sut.decode(from: URL(string: "key")!)

            XCTAssertEqual(data, storedData)
        } catch {
            XCTFail("Unexpected error")
        }
    }

    func testKeyNotFound() async {
        sut = MemoryStorage()
        do {
            let storedData: String? = try await sut.decode(from: URL(string: "key-not-found")!)

            XCTAssertNil(storedData)
        } catch {
            XCTFail("Unexpected error")
        }
    }
}
