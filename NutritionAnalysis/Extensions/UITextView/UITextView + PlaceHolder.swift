//
//  TextViewWithPlaceHolder.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 10/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit
// swiftlint:disable force_cast
extension UITextView: UITextViewDelegate {
    // Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }

    // The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?

            if let placeholderLabel = self.viewWithTag(200) as? UILabel {
                placeholderText = placeholderLabel.text
            }

            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(200) as? UILabel? {
                placeholderLabel?.removeFromSuperview()
                self.addPlaceholder(newValue ?? "")
            } else {
                self.addPlaceholder(newValue ?? "")
            }
        }
    }

    // When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    // - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_: UITextView) {
        if let placeholderLabel = self.viewWithTag(200) as? UILabel {
            placeholderLabel.isHidden = self.text.count > 0
        }
    }

    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(200) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top + 2
            let labelWidth = 200
            let labelHeight = placeholderLabel.frame.height

            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: CGFloat(labelWidth), height: labelHeight)
        }
    }

    // Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()

        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()

        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 200

        placeholderLabel.isHidden = self.text.count > 0

        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
}
