
import UIKit

class MyGroupViewController: UITableViewController, UISearchBarDelegate {
    
    var friends = [String]()
 
    var group = [
        "Работа",
        "Отпуск",
        "Партнеры",
        "Друзья",
        ]
    
    //MARK: - Action
    
    @IBAction func closeKeyboardAction() {   // убираем клавиатуру по тапу
        print("closeKeyboardAction")
        self.view.endEditing(true)
    }
    
    //MARK: - Lyfecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
//    let bar = UISearchBar()
//    bar.delegate = self.func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
//    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroup", for: indexPath) as! MyGroupCell
        // получаем данные друга для конкретной строки
        let friend = friends[indexPath.row]
        // устанавливаем данные друга в значение ячейки
        cell.name.text = friend
        
        return cell
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        return cell
//    }
//
//
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//    }
//
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    //}
}
