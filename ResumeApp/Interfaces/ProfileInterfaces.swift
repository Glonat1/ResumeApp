
import UIKit

/// Profile view interface declaration
protocol ProfileViewInterface: ViewInterface {
    // MARK: - Properties
    var experienceSection: [ExperienceCellPresenter]? {get set}
    var skillsSection: [SkillsCellPresenter]? {get set}
    var informationSection: InformationCellPresenter? {get set}
    var aboutSection: AboutCellPresenter? {get set}
    // MARK: - Methods
    func showProfileInfo(with profileInfo: Profile)
    func showNetworkingError()
    func imageFromData(data: Data)
}

/// Profile presenter interface declaration
protocol ProfilePresenterInterface: PresenterInterface {
    // MARK: - Methods
    func updateView()
    func getImage(imageURL: String)
}

/// Profile interactor interface declaration
protocol ProfileInteractorInterface: InteractorInterface {
    func fetchProfileInfo(completion: @escaping (Result<Profile, ServiceConstants.NetworkingError>) -> Void)
    func fetchImage(withURL url: String, completion: @escaping (Result<Data, ServiceConstants.NetworkingError>) -> Void)
}
