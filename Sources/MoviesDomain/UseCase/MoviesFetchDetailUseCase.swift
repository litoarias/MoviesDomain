import Foundation
import MoviesCommons

@available(iOS 13.0.0, *)
public protocol MoviesFetchDetailUseCaseContract {
    func execute(identifier: Int) async -> Result<MovieModel, DomainError>
}

@available(iOS 13.0.0, *)
public struct MoviesFetchDetailUseCase: MoviesFetchDetailUseCaseContract {
    @Dependency private(set) var service: MoviesServiceContract
    
    public init() { }
   
    public func execute(identifier: Int) async -> Result<MovieModel, DomainError> {
        return await service.getMovieDetail(id: identifier)
    }
}
