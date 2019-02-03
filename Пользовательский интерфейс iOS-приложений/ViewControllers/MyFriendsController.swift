
import UIKit

class MyFriendsController: UITableViewController {
    
    var friends = [String]()
    var friendImage: UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // определяем количество столбцов
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // определяем количество столбцов
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // получаем пул ячеек
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendCell", for: indexPath) as! MyFriendsCell
        // получаем данные друга для конкретной строки
        let friend = friends[indexPath.row]
        // устанавливаем данные друга в значение ячейки
        cell.friendName.text = friend
        cell.friendImage.image = friendImage
        
        return cell
    }
    
    @IBAction func addFriends(segue: UIStoryboardSegue) {
        // проверяем идентификатор сегуи чтобы убедиться, что это нужный переход
        guard segue.identifier == "addFriends" else { return }
        // получаем ссылку на контроллер с которого осуществлен переход
        let allFriendsController = segue.source as! AllFriendsController
        // получаем индекс выделенной ячейки
        guard let indexPath = allFriendsController.tableView.indexPathForSelectedRow else { return }
        // получаем данные друга по индексу
        let friend = allFriendsController.friends[indexPath.row]
        //проверяем на дубли список друзей
        guard !friends.contains(friend) else { return }
        // добавляем друга в список выбранных городов
        friends.append(friend)
        //обновляем таблицу
        tableView.reloadData()
    }
    
    //функция для удаления друзей из списка выбранных
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // если была нажата кнопка "Удалить"
        if editingStyle == .delete {
            // удаляем друга из массива
            friends.remove(at: indexPath.row)
            // удаляем друга из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

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
