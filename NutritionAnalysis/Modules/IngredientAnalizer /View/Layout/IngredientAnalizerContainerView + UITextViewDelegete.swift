//
//  IngredientAnalizerContainerView + UITextViewDelegete.swift
//  NutritionAnalysis
//
//  Created by Alchemist on 11/07/2021.
//  Copyright © 2021 BankMisr. All rights reserved.
//

import Foundation
import UIKit

extension IngredientAnalizerContainerView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.isAnalizeEnabled?(textView.text.count > 0)
        if let placeholderLabel = self.viewWithTag(200) as? UILabel {
            placeholderLabel.isHidden = textView.text.count > 0
        }
    }
}
