import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    let sections = ["Account",
                    "System Settings", "Features"]
    let settings = [
       [["Apple Account", "Sign in to access your iCloud data, the App Store, Apple services and more.", "applelogo", true]],
        [["General", "", "gearshape.fill", false],
         ["Accessibility", "", "accessibility", false],
         ["Action Button", "", "arrow.right.square.fill", false],
         ["Apple Intelligence & Siri", "", "gear", false],
         ["Camera", "", "camera.fill", false],
         ["Home Screen & App Library", "", "square.grid.2x2.fill", false],
         ["Search", "", "magnifyingglass", false],
         ["StandBy", "", "bed.double.fill", false]],
        [["Screen Time", "", "hourglass", false],
         ["Privacy & Security", "", "hand.raised.fill", false]]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        print(settings)
    }
    
    func setupUI() {
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGroupedBackground
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        tableView.register(AppleIDCell.self, forCellReuseIdentifier: "AppleIDCell")
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.section][indexPath.row]
        
        if setting[3] as! Bool {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AppleIDCell", for: indexPath) as! AppleIDCell
            cell.configure(title: setting[0] as! String, subtitle: setting[1] as! String, iconName: setting[2] as! String)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
            cell.configure(title: setting[0] as! String, iconName: setting[2] as! String)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return settings[indexPath.section][indexPath.row][3] as! Bool ? 80 : 44
    }
}

class SettingsCell: UITableViewCell {
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            iconContainer.widthAnchor.constraint(equalToConstant: 30),
            iconContainer.heightAnchor.constraint(equalToConstant: 30),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
    
    func configure(title: String, iconName: String) {
        label.text = title
        iconImageView.image = UIImage(systemName: iconName)
        iconContainer.backgroundColor = getIconBackgroundColor(for: title)
        iconContainer.layer.cornerRadius = 6
    }
    
    private func getIconBackgroundColor(for title: String) -> UIColor {
        switch title {
        case "General": return .systemGray
        case "Accessibility": return .systemBlue
        case "Action Button": return .systemBlue
        case "Apple Intelligence & Siri": return .systemPink
        case "Camera": return .systemGray
        case "Home Screen & App Library": return .systemBlue
        case "Search": return .systemGray
        case "StandBy": return .black
        case "Screen Time": return .systemPurple
        case "Privacy & Security": return .systemBlue
        default: return .systemBlue
        }
    }
}

class AppleIDCell: UITableViewCell {
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        accessoryType = .disclosureIndicator

        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 4

        contentView.addSubview(iconImageView)
        contentView.addSubview(stackView)

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),

            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }

    func configure(title: String, subtitle: String, iconName: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle

        // Create circular Apple logo with dots
        let configuration = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
        iconImageView.image = UIImage(systemName: iconName, withConfiguration: configuration)
        iconImageView.tintColor = .systemBlue
    }
}
