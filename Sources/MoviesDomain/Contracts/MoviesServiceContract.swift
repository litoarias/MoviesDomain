import Foundation

public protocol MoviesServiceContract {
    func getTopRated() async -> Result<TopRatedModel, DomainError>
    func getMovieDetail(id: Int) async -> Result<MovieModel, DomainError>
}
