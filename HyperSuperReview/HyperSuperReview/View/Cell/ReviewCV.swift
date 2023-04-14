import UIKit

class ReviewCV: UICollectionViewCell {
    
    static let identifier = "ReviewCV"
    
    
    var image: UIImageView = {
        let label = UIImageView()
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var filmName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    var author: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var content: UITextView = {
        let tw = UITextView()
        tw.isUserInteractionEnabled  = false
        tw.textColor = .white
        tw.backgroundColor = .black
        tw.font = .systemFont(ofSize: 13)
        tw.translatesAutoresizingMaskIntoConstraints = false
        return tw
    }()
    
    lazy var leftside: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [image])
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    let star1: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    let star2: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    let star3: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    let star4: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    let star5: StarButton = {
        let button = StarButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    lazy var starStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
        star1,
        star2,
        star3,
        star4,
        star5
        ])
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var rightside: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [author,filmName,content,starStackView])
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftside,rightside])
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(mainVStackView)
        
        NSLayoutConstraint.activate([
            mainVStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainVStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainVStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainVStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    
}


