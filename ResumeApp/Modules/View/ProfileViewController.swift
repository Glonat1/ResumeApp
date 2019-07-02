
import UIKit

final class ProfileViewController: UIViewController, Storyboarded {
    
    //MARK: - Outlets
    @IBOutlet weak var emptyStateView: UIView?
    @IBOutlet weak var retryButton: UIButton?
    @IBOutlet weak var profileStackView: UIStackView?
    @IBOutlet weak var sectionCollectionView: UICollectionView?
    @IBOutlet weak var bottomContainer: UIView?
    @IBOutlet weak var pageController: UIPageControl?
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.clipsToBounds = true
        imageView.accessibilityIdentifier = AccessibilityIdentifiers.ImageViews.profilePicture.rawValue
        return imageView
    } ()
    
    lazy var profileName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 24)
        label.textAlignment = .center
        label.accessibilityIdentifier = AccessibilityIdentifiers.Labels.profileName.rawValue
        return label
    }()

    // MARK: - Properties
    var presenter: ProfilePresenterInterface?
    var experienceSection: [ExperienceCellPresenter]? {
        didSet {
            sectionCollectionView?.reloadData()
        }
    }
    var aboutSection: AboutCellPresenter? {
        didSet {
            sectionCollectionView?.reloadData()
        }
    }
    var skillsSection: [SkillsCellPresenter]? {
        didSet {
            sectionCollectionView?.reloadData()
        }
    }
    var informationSection: InformationCellPresenter? {
        didSet {
            sectionCollectionView?.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        setUpSectionsCollection()
        createSubViewsWithConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViewCorners()
    }
    
    @IBAction func retryAction(_ sender: Any) {
        presenter?.updateView()
    }
    
    func setUpSectionsCollection() {
        sectionCollectionView?.dataSource = self
        sectionCollectionView?.delegate = self
        sectionCollectionView?.register(UINib(nibName: CellConstants.NibName.experience.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellConstants.Identifier.experience.rawValue)
        sectionCollectionView?.register(UINib(nibName: CellConstants.NibName.about.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellConstants.Identifier.about.rawValue)
        sectionCollectionView?.register(UINib(nibName: CellConstants.NibName.skills.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellConstants.Identifier.skills.rawValue)
        sectionCollectionView?.register(UINib(nibName: CellConstants.NibName.information.rawValue, bundle: nil),
                                        forCellWithReuseIdentifier: CellConstants.Identifier.information.rawValue)
    }
}

// MARK: - ProfileViewInterface Extension
extension ProfileViewController: ProfileViewInterface {
    
    func showProfileInfo(with profileInfo: Profile) {
        profileName.text = profileInfo.name
        emptyStateView?.isHidden = true
        profileStackView?.isHidden = false
    }
    
    func showNetworkingError() {
        emptyStateView?.isHidden = false
        profileStackView?.isHidden = true
    }
    
    func imageFromData(data: Data) {
        profileImage.image = UIImage(data: data)
    }
}
