import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var tableView: UITableView!
    private var addContactButton: UIButton!
    private var searchField: UITextField!
    private var sections: [String] = ["K", "M", "N", "R", "S"]
    private var names: [String] = ["Katherine", "Marjorie", "Nick", "Riven", "Summer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "All contacts"
        
        view.backgroundColor = .white
        addContactButton = UIButton()
        addContactButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addContactButton.setTitleColor(.black, for: .normal)
        addContactButton.addTarget(self, action: #selector(addContactTapped), for: .touchUpInside)
        view.addSubview(addContactButton)
        addContactButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
        }
        
        searchField = UITextField()
        searchField.placeholder = "Search"
        searchField.textAlignment = .center
        searchField.borderStyle = .roundedRect
        searchField.backgroundColor = .lightGray
        view.addSubview(searchField)
        searchField.snp.makeConstraints { make in
            make.top.equalTo(addContactButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func addContactTapped() {
        // Handle add contact button tapped
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections in your contact list
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of contacts in each section of your contact list
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return the section header for each section of your contact list
        return sections[section]
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let headerView = UIView()
//            headerView.backgroundColor = UIColor.lightGray
//            return headerView
//        }
//    private func tableView(_ tableView: UITableView, attributedTitleForHeaderInSection section: Int) -> NSAttributedString? {
//            let headerText = "Section \(section + 1)"
//            let attrs = [NSAttributedString.Key.backgroundColor: UIColor.red] // Set the background color of the text
//            return NSAttributedString(string: headerText, attributes: attrs)
//        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row + indexPath.section]
        return cell
    }
}
