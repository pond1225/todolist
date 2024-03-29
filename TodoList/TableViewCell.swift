//
//  TableViewCell.swift
//  TodoList
//  Created by t2023-m0049 on 3/26/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tableCellText: UILabel!
    @IBOutlet weak var todoSwitch: UISwitch!
    
    private var previousText: String {
        tableCellText.text ?? ""
    }
    
    var isSwitchOn = true
    
    @IBAction func todoSwitch(_ sender: UISwitch) {
        isSwitchOn = sender.isOn
        updateLabelStrikeThrough()
    }
    
    func updateLabelStrikeThrough() {
        if !todoSwitch.isOn {
            tableCellText.attributedText = NSAttributedString(string: previousText)
        } else {
            tableCellText.attributedText = tableCellText.text?.strikeThrough()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
