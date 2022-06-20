import XCTest
import MoviesCommons
@testable import MoviesDomain

struct Dependencies {
    init() {
        DependencyContainer.register(MoviesServiceMock() as MoviesServiceContract)
    }
}
