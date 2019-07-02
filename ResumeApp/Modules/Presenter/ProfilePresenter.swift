
import UIKit

final class ProfilePresenter {
    
    // MARK: - Private properties
    private unowned let view: ProfileViewInterface
    private let interactor: ProfileInteractorInterface
    
    // MARK: - Lifecycle
    init(view: ProfileViewInterface, interactor: ProfileInteractorInterface) {
        self.view = view
        self.interactor = interactor
    }
}

// MARK: - ProfilePresenterInterface Extension
extension ProfilePresenter: ProfilePresenterInterface {
    
    //Method for update the vieew
    func updateView() {
        interactor.fetchProfileInfo { [weak self] response in
            self?.handleServiceResponse(response)
        }
    }
    
    //Handle for recive the response from the service
    func handleServiceResponse(_ response: Result<Profile, ServiceConstants.NetworkingError>) {
        DispatchQueue.main.async {
            switch response {
            case .success(let profile):
                self.getImage(imageURL: profile.pictureURL)
                self.setupSectionCells(with: profile.sections)
                self.view.showProfileInfo(with: profile)
            case .failure:
                self.view.showNetworkingError()
            }
        }
    }
    
    //Method for setup the cells depending of the number of sections
    func setupSectionCells(with sectionsResponse: [Section]) {
        
        if let summarySection = sectionsResponse[0].summary {
            view.aboutSection = AboutCellPresenter(aboutLabel: summarySection)
        }
        if let experienceSection = sectionsResponse[1].experience {
            view.experienceSection = [ExperienceCellPresenter]()
            experienceSection.forEach{ job in
                let cellPresenter = ExperienceCellPresenter(company: job.company, start: job.start, end: job.end, designation: job.designation)
                view.experienceSection?.append(cellPresenter)
            }
        }
        
        if let skillsSection = sectionsResponse[2].skills {
            view.skillsSection = [SkillsCellPresenter]()
            skillsSection.forEach { skill in
                let cellSkill = SkillsCellPresenter(skill: skill.skill, time: skill.time)
                view.skillsSection?.append(cellSkill)
            }
        }
        if let informationSection = sectionsResponse[3].information {
            view.informationSection = InformationCellPresenter(directionLabel: informationSection.direction, cellphoneLabel: informationSection.cellphone, emailLabel: informationSection.email)
        }
    }
    //Handle for recive the image response from a data
    func handServiceImageResponse(_ response: Result<Data, ServiceConstants.NetworkingError>) {
        switch response {
        case .success(let imageData):
            view.imageFromData(data: imageData)
        case .failure:
            view.showNetworkingError()
        }
    }
    //Method for create a response by the image url recibed from the service 
    func getImage(imageURL: String) {
        interactor.fetchImage(withURL: imageURL) { imageResponse in
            self.handServiceImageResponse(imageResponse)
        }
    }
}
