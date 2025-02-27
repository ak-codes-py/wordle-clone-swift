//
//  KeyboardCell.swift
//  Wordle
//
//  Created by Mari Batilando on 2/12/23.
//

import UIKit

class KeyboardCell: UICollectionViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var labelContainerView: UIView!
  private var string: String!
  var didSelectString: ((String) -> Void)!

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapString))
    contentView.addGestureRecognizer(tapGestureRecognizer)
  }

  func configure(with string: String) {
    /* Exercise 2:
      1. Assign the argument `string` to the `self.string` private property (see line 14)
      2. Change the text of the label to the value of the passed in string
        Tip: Command + click into the UILabel type to see its definition and find out what property to set
      Checkpoint: After finishing this exercise, you should now be able to see the keyboard laid out on the screen! If it's not working, check your work on exercises 1 & 2.
    */
       labelContainerView.layer.cornerRadius = 12.0
       labelContainerView.backgroundColor = UIColor.systemGray5
       // Add a subtle border for definition
       labelContainerView.layer.borderColor = UIColor.systemGray4.cgColor
       labelContainerView.layer.borderWidth = 1.0
       // Add a subtle shadow for depth
       labelContainerView.layer.shadowColor = UIColor.black.cgColor
       labelContainerView.layer.shadowOpacity = 0.1
       labelContainerView.layer.shadowOffset = CGSize(width: 0, height: 0)
       labelContainerView.layer.shadowRadius = 4.0

      self.string = string
       label.text = string
       label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
       label.textColor = .label
       label.textAlignment = .center
  }

  // Exercise 5: Call the `didSelectString` closure and pass in the string this cell holds (see line 14)
  // Checkpoint: After finishing this exercise, you should now be able to tap on a keyboard cell and have the letter shown on the board! If it's not working, check your work on exercises 3,4, and 5.
  @objc private func didTapString() {
      UIView.animate(withDuration: 0.1,
                         animations: {
                           self.labelContainerView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           self.labelContainerView.backgroundColor = UIColor.systemGray3
                         },
                         completion: { _ in
                           UIView.animate(withDuration: 0.1,
                                          animations: {
                                            self.labelContainerView.transform = CGAffineTransform.identity
                                            self.labelContainerView.backgroundColor = UIColor.systemGray5
                                          },
                                          completion: { _ in
                                            self.didSelectString(self.string)
                                          })
                         })
        }
  }

