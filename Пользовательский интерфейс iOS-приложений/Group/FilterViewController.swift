

import UIKit

class FilterViewController: UITableViewController, UISearchBarDelegate {
    
    var friends = [String]()
    
    // создаем массив групп
    var group = [
        "Работа",
        "Отпуск",
        "Партнеры",
        "Друзья",
        ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // на скролл вью добавили рекогнайзер, который будет отрабатывать на Тап
//        let hideRecoghizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        // тут мы вешаем рекогнайзер на Тап вью
//        scrollView.addGestureRecognizer(hideRecoghizer)
//        // подписываемся на уведомления когда клавиатура должна появиться
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyBoardWasShow),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil
//        )
//        // подписываемся на уведомления когда клавиатура должна появиться
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyBoardWasShow),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil
//        )
    }
    
    // тут отписываемся от уведомлений (начиная с 12.0 Не ненужно это делать)
    func viewWillDissapear(_ animated: Bool){
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    поиск через делегат
//    let bar = UISearchBar()
//    bar.delegate = self.func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    
    
//    // забираем размеры клавиатуры
//    @objc func keyBoardWasShow (notification: Notification) {
//        guard
//            let info = notification.userInfo as NSDictionary?,
//            let kbSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
//            else { return }
//
//        let insets = UIEdgeInsets(top:0 , left: 0, bottom: kbSize.height, right: 0)
//
//        scrollView.contentInset = insets
//        scrollView.scrollIndicatorInsets = insets
//    }
//
//    // этот метод прячет клавиатуру при Тапе
//    @objc func keyboardWasHiden(){
//        scrollView.endEditing(true)
//    }
//
//    // этот метод обнуляет инсеты
//    @objc func hideKeyboard(){
//        scrollView.contentInset = .zero
//        scrollView.scrollIndicatorInsets = .zero
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // получаем пул ячеек
        let cell = tableView.dequeueReusableCell(withIdentifier: "Filter", for: indexPath) as! FilterCell
        // получаем данные друга для конкретной строки
        let friend = friends[indexPath.row]
        // устанавливаем данные друга в значение ячейки
        cell.name.text = friend
        
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
