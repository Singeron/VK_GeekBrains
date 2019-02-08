
import UIKit

class MyFriendsCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var friendImage: UIImageView! // вывели картинку в ячейку
    @IBOutlet weak var friendName: UILabel! // вывели имя в ячейку
    
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            self.shadowView.layer.shadowOffset = shadowOffset
            self.shadowView.layer.shadowOpacity = self.shadowOpacity
            self.shadowView.layer.shadowRadius = self.shadowRadius
            self.shadowView.backgroundColor = .clear
            self.shadowView.layer.shadowColor = UIColor.black.cgColor
            self.shadowView.layer.shadowPath = UIBezierPath(ovalIn: self.shadowView.bounds).cgPath
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.clipsToBounds = true
            self.containerView.layer.cornerRadius = self.containerView.frame.width / 2
            // self.containerView.frame = self.shadowView.bounds
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
    
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.3
    
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 10
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
