//
//  TooltipView.swift
//  TooltipKit
//
//  Created by Jayvee on 5/30/25.
//

import UIKit

public class TooltipView: UIView {
    public var attributes: TooltipViewAttributes!
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        
        return label
    }()

    var arrowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .green
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

extension TooltipView {
    private func setupView() {
        addSubview(arrowView)
        addSubview(containerView)
        containerView.addSubview(label)
    }
}

extension TooltipView {
    public func bind(_ attributes: TooltipViewAttributes) {
        backgroundColor = UIColor.clear
        containerView.layer.cornerRadius = attributes.cornerRadius
        containerView.backgroundColor =  attributes.backgroundColor
        arrowView.backgroundColor = attributes.backgroundColor
        label.configure(with: attributes)
        
        NSLayoutConstraint.activate([
            arrowView.topAnchor.constraint(equalTo: topAnchor),
            arrowView.centerXAnchor.constraint(equalTo: centerXAnchor),
            arrowView.widthAnchor.constraint(equalToConstant: 100.0),
            arrowView.heightAnchor.constraint(equalToConstant: 13.0),
            containerView.topAnchor.constraint(equalTo: arrowView.bottomAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3.5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3.5),
            label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 5.0),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15.0),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15.0)
        ])
    }
}
