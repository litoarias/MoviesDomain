public enum DomainError: Error {
    case decode
    case invalidURL(String)
    case noResponse
    case unauthorized
    case unexpectedStatusCode(Int)
    case unknown
}
