import Foundation
import MoviesCommons

public protocol MoviesFetchTopRatedUseCaseContract {
    func execute() async -> Result<TopRatedModel, DomainError>
}

public struct MoviesFetchTopRatedUseCase: MoviesFetchTopRatedUseCaseContract {
    @Dependency private(set) var service: MoviesServiceContract

    public init() {}
    
    public func execute() async -> Result<TopRatedModel, DomainError> {
        return await service.getTopRated()
    }
}
