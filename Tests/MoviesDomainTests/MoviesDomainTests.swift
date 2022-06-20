import XCTest
import MoviesCommons
@testable import MoviesDomain

final class MoviesDomainTests: XCTestCase {
    var dependencies = Dependencies()
    var moviesFetchDetailUseCase: MoviesFetchDetailUseCase!
    var moviesFetchTopRatedUseCase: MoviesFetchTopRatedUseCase!

    override func setUp() {
        super.setUp()
        moviesFetchDetailUseCase = MoviesFetchDetailUseCase()
        moviesFetchTopRatedUseCase = MoviesFetchTopRatedUseCase()
    }

    func testGetMovies() async {
        let result = await moviesFetchTopRatedUseCase.execute()
        guard case let .success(topRated) = result else {
            XCTFail("Should success")
            return
        }
        XCTAssertEqual(topRated.results.count, 1)
        
    }
    
    func testGetMovieDetailSuccess() async {
        let result = await moviesFetchDetailUseCase.execute(identifier: 4)
        guard case let .success(movie) = result else {
            XCTFail("Should success")
            return
        }
        XCTAssertEqual(movie, MoviesServiceMock.moviewMock)
    }
    
    func testGetMovieDetailFailure() async {
        let result = await moviesFetchDetailUseCase.execute(identifier: -1)
        guard case let .failure(error) = result else {
            XCTFail("Should failured")
            return
        }
        guard case DomainError.unauthorized = error else {
            XCTFail("Should DomainError.unauthorized")
            return
        }
    }
}
