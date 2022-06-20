@testable import MoviesDomain

final class MoviesServiceMock: MoviesServiceContract {
    var getTopRatedCalled = false
    var getMovieDetail = false
    
    static let moviewMock = MovieModel(
        adult: true,
        backdropPath: "",
        genreIDS: [],
        id: 2,
        originalLanguage: "",
        originalTitle: "",
        overview: "",
        popularity: 2,
        posterPath: "",
        releaseDate: "",
        title: "",
        video: false,
        voteAverage: 3,
        voteCount: 2
    )
    
    func getTopRated() async -> Result<TopRatedModel, DomainError> {
        getTopRatedCalled = true
        return .success(TopRatedModel(page: 1, totalPages: 12, totalResults: 1, results: [Self.moviewMock]))
    }
    
    func getMovieDetail(id: Int) async -> Result<MovieModel, DomainError> {
        getMovieDetail = true
        if id == -1 {
            return .failure(DomainError.unauthorized)
        }
        return .success(Self.moviewMock)
    }
}
