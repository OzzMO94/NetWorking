//
//  CoursesViewController.swift
//  NetWorking
//
//  Created by Максим Хабиров on 22.02.2022.
//

import UIKit

class CoursesViewController: UITableViewController {
    
    private var courses: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCourses", for: indexPath) as! CourseCell
        


        return cell
    }
}


// MARK: - Networking

extension CoursesViewController {
    func fetchCourse() {
        guard let url = URL(string: URLExamples.exampleTwo.rawValue) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.courses = try JSONDecoder().decode([Course].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
