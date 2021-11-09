import Foundation

public protocol Storable {
    func store(_ data: Data, to url: URL) async throws
    func load(from url: URL) async throws -> Data?
}

public extension Storable {
    func encode<T: Encodable>(_ object: T, to URL: URL) async throws {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(object)
        try await store(data, to: URL)
    }

    func decode<T: Decodable>(from url: URL) async throws -> T? {
        guard
            let data = try await load(from: url)
        else {
            return nil
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}
