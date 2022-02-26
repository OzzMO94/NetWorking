//
//  CourseCell.swift
//  NetWorking
//
//  Created by Максим Хабиров on 22.02.2022.
//

import UIKit

class CourseCell: UITableViewCell {
    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var numberOfLessonsLabel: UILabel!
    @IBOutlet weak var numberOfTestsLabel: UILabel!
    
    func configur(with course: Course) {
        courseNameLabel.text = course.name
        numberOfLessonsLabel.text = "Number of lessons \(course.number_of_lessons ?? 0)"
        numberOfTestsLabel.text = "Number of tests \(course.number_of_tests ?? 0)"
    }
}
