class Job < ApplicationRecord
    belongs_to :user
    has_many :employee_jobs
    has_many :employees, through: :employee_jobs

    def remove_employees
        employees.each { |employee|
            employee.job = nil
            employee.save
        }
    end

    def end_date
        return start_date + days_to_complete.days
    end
end
