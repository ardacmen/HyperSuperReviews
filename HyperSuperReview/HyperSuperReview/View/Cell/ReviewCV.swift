import UIKit

class ReviewCV: UICollectionViewCell {
    
    static let identifier = "ReviewCV"
    
    var film: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
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
    
    
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [author,
                                                   film,
                                                  content])
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
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
            author.heightAnchor.constraint(equalToConstant: 40),
            film.heightAnchor.constraint(equalToConstant: 40),
            content.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
}


