
import UIKit

class FriendsViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // получаем пул ячеек
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AboutFriendCell", for: indexPath) as! FriendsCell
        // устанавливаем друга в значение ячейки
        cell.name.text = "Иван"
        cell.group.text = "Работа"
        return cell
    }
}
