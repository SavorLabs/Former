//
//  TextViewFormer.swift
//  Former-Demo
//
//  Created by Ryo Aoyama on 7/26/15.
//  Copyright © 2015 Ryo Aoyama. All rights reserved.
//

import UIKit

public protocol TextFormableView: FormableView {
    
    func formableTextLabel() -> UILabel
}

public class TextViewFormer: ViewFormer {
    
    public var text: String?
    public var font: UIFont?
    public var textColor: UIColor?
    public var textAlignment: NSTextAlignment?
    
    public init<T: UITableViewHeaderFooterView where T: FormableView>(viewType: T.Type, text: String? = nil) {
        
        super.init(viewType: viewType)
        self.text = text
    }
    
    public override func viewConfigureIfFormable() {
        
        guard let view = self.view as? TextFormableView else { return }
        
        let textLabel = view.formableTextLabel()
        textLabel.text = self.text
        textLabel.font = self.font
        textLabel.textColor = self.textColor
        textLabel.textAlignment =? self.textAlignment
    }
}