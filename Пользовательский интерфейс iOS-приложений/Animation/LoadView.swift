
import UIKit

class LoadView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.width = 8
        self.frame.size.height = 8
        self.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
