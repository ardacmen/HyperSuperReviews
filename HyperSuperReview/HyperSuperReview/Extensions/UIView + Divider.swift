import UIKit

extension UIView {
    convenience init(label: String, horizontalPadding: CGFloat = 0, color: UIColor = .white, leftLine: Bool = true, rightLine: Bool = true) {
        self.init(frame: .zero)
        setupView(label: label, horizontalPadding: horizontalPadding, color: .lightGray, leftLine: leftLine, rightLine: rightLine)
    }

    func setupView(label: String, horizontalPadding: CGFloat, color: UIColor, leftLine: Bool, rightLine: Bool) {
        let labelView = UILabel()
        labelView.text = "   \(label)   "
        labelView.textColor = color
        labelView.font = .systemFont(ofSize: 12.0)
        addSubview(labelView)

        if leftLine {
            let leftLineView = UIView()
            leftLineView.backgroundColor = color
            addSubview(leftLineView)
            leftLineView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                leftLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
                leftLineView.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
                leftLineView.trailingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: -horizontalPadding),
                leftLineView.heightAnchor.constraint(equalToConstant: 0.6)
            ])
        }

        if rightLine {
            let rightLineView = UIView()
            rightLineView.backgroundColor = color
            addSubview(rightLineView)
            rightLineView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                rightLineView.leadingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: horizontalPadding),
                rightLineView.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
                rightLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
                rightLineView.heightAnchor.constraint(equalToConstant: 0.6)
            ])
        }

        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

