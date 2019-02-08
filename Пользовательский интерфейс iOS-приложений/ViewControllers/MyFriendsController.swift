
import UIKit

class MyFriendsController: UITableViewController {
    
    @IBOutlet weak var searchFriends: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    var searchActive : Bool = false
    var fotoDelegate = [String]()
    private var shadowLayer: CAShapeLayer!
    var filteredFriends: [String] = []
    
    var myFriends = ["Иванов Иван", "Петров Петр", "Сидоров Сидор", "Субботин Андрей", "Соколов Дмитрий", "Смирнов Станислав", "Суворов Петр", "Павлова Арина", "Полякова Диана", "Петухов Александр", "Устинова Татьяна", "Ургант Валерий", "Уваров Денис", "Исаев Алексей", "Искакова Галина", "Ильина Екатерина", "Панов Евгений", "Давлова Анастасия", "Потапов Сергей", "Вестов Юрий", "Попова Евгения", "Тимофеев Антон"]
    var fotoMyFriends = ["Иванов Иван": ["vk_logo","yellow", "red", "rose"], "Петров Петр": ["friend","green", "fir", "line"], "Сидоров Сидор": ["groups","orange", "blue", "heart"], "Субботин Андрей": ["yellow", "red"], "Соколов Дмитрий": ["green", "fir"], "Смирнов Станислав":["orange", "blue"], "Суворов Петр":["orange", "rose"], "Павлова Арина": ["orange"], "Полякова Диана": ["vk_logo","yellow"], "Петухов Александр": ["friend", "green"], "Устинова Татьяна": ["vk_logo"], "Ургант Валерий": ["friend"], "Уваров Денис": ["groups"], "Исаев Алексей": ["red"], "Искакова Галина": ["green"], "Ильина Екатерина": ["heart"], "Панов Евгений": ["line"], "Давлова Анастасия": ["yellow"], "Потапов Сергей": ["fir"], "Вестов Юрий": ["noLike"], "Попова Евгения": ["like"], "Тимофеев Антон": ["rose"]]
    var characters: [String] =  ["В", "Д", "И", "П", "С", "Т", "У"]
    var myFriendsCharacter = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = .default
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filteredFriends = myFriends.filter({(text) -> Bool in
                let tmp: NSString = text as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            searchActive = true
            tableView.reloadData()
        }
        else {
            searchActive = false
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchActive = false
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    // определяем количество столбцов
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if searchActive {
            return 1
        } else {
            return characters.count
            
        }
    }
    // определяем количество столбцов
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            myFriendsCharacter = filteredFriends
        } else {
            myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[section]) }
        }
        return myFriendsCharacter.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        if searchActive {
            return 0
        } else {return CGFloat(28)}
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendsCell
        //  let friend = myFriendsCharacter[indexPath.row]
        //cell.friendName.text = friend
        self.navigationController?.navigationBar.barStyle = .default
        if searchActive {
            myFriendsCharacter = filteredFriends//.filter {$0[$0.startIndex] == Character(characters[indexPath.section]) }
            cell.friendName.text = myFriendsCharacter[indexPath.row]
            //  cell.sectio
        } else { myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[indexPath.section]) }
            cell.friendName.text = myFriendsCharacter[indexPath.row]}
        cell.layer.backgroundColor = UIColor.clear.cgColor
        if let nameAvatar = fotoMyFriends[(cell.friendName.text)!]?.last {
            
            // add subcontent
            let photo = UIImageView()
            photo.image = UIImage(named: nameAvatar)
            photo.frame = cell.containerView.bounds
            cell.containerView.addSubview(photo)
            
        }
        self.navigationController?.navigationBar.barStyle = .default
        return cell
        
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if searchActive {
            return nil
        } else {
            return characters
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = tableView.backgroundColor
        headerView.alpha = 0.5
        let label = UILabel(frame: CGRect(x: 20, y: 8, width: 150, height: 20))
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        label.text = characters[section]
        headerView.addSubview(label)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let heightCell = cell.frame.height//cell.bounds.height
        let widhtCell = cell.frame.width//cell.bounds.width
        cell.alpha = 0
        cell.frame.size.height = 0//origin.x = 0
        cell.frame.size.width = 0
        //  cell.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1
            cell.frame.size.height = heightCell
            cell.frame.size.width = widhtCell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "allFotoFriend" {
            let fotoFriendsController : FotoFriendCollectionController = segue.destination as! FotoFriendCollectionController
            let myFriendsController = segue.source as! MyFriendsController
            //  Получаем индекс выделенной ячейки
            if let indexPath = myFriendsController.tableView.indexPathForSelectedRow {
                if searchActive {
                    myFriendsCharacter = filteredFriends
                }
                else {
                    myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[indexPath.section]) }}
                // Получаем друга по индексу
                let friend = myFriendsController.myFriendsCharacter[indexPath.row]
                if let fotoDelegate = myFriendsController.fotoMyFriends[friend] {
                    fotoFriendsController.fotoDelegate = fotoDelegate
                }
            }
        }
    }
}
    
//    @IBAction func addFriends(segue: UIStoryboardSegue) {
//        // проверяем идентификатор сегуи чтобы убедиться, что это нужный переход
//        guard segue.identifier == "addFriends" else { return }
//        // получаем ссылку на контроллер с которого осуществлен переход
//        let allFriendsController = segue.source as! AllFriendsController
//        // получаем индекс выделенной ячейки
//        guard let indexPath = allFriendsController.tableView.indexPathForSelectedRow else { return }
//        // получаем данные друга по индексу
//        let friend = allFriendsController.friends[indexPath.row]
//        //проверяем на дубли список друзей
//        guard !friends.contains(friend) else { return }
//        // добавляем друга в список выбранных городов
//        friends.append(friend)
//        //обновляем таблицу
//        tableView.reloadData()
//    }
//    
//    //функция для удаления друзей из списка выбранных
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        // если была нажата кнопка "Удалить"
//        if editingStyle == .delete {
//            // удаляем друга из массива
//            friends.remove(at: indexPath.row)
//            // удаляем друга из таблицы
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
