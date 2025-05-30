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
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 5.0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0)
        ])
    }
}

extension TooltipView {
    public func bind(_ attributes: TooltipViewAttributes) {
        backgroundColor = attributes.backgroundColor
        label.configure(with: attributes)
    }
}
