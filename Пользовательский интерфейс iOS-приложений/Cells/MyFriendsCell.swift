
import UIKit

class MyFriendsCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var friendImage: UIImageView! // вывели картинку в ячейку
    @IBOutlet weak var friendName: UILabel! // вывели имя в ячейку
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
