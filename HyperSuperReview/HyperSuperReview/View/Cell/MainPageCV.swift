import UIKit

class MainPageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainPageCollectionViewCell"
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mainVStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, label])
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
            label.heightAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    
}

