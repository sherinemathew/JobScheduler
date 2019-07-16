class Job < ApplicationRecord
    belongs_to :user
    has_many :employees

    def remove_employees
        employees.each { |employee|
            employee.job = nil
            employee.save
        }
    end
end
