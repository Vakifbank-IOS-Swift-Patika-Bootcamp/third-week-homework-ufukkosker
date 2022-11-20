//
//  NibloadableView.swift
//  ZooKeeper
//
//  Created by Ufuk on 17.11.2022.
//

import UIKit

class NibLoadableView: UIView {
    // MARK: - Public variables
    var contentView: UIView?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        setup()
    }

    // MARK: - Public functions
    func setup() {}

    func loadViewFromNib() -> UIView? {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    // MARK: - Private functions
    private func configureView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        contentView = view
    }
}
