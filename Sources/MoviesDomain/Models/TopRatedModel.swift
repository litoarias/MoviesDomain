public struct TopRatedModel: BaseModel {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    public let results: [MovieModel]
    
    public init(page: Int, totalPages: Int, totalResults: Int, results: [MovieModel]) {
        self.page = page
        self.totalPages = totalPages
        self.totalResults = totalResults
        self.results = results
    }
}
