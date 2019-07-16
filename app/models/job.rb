class Job < ApplicationRecord
    validates :name, presence: true
    validates :location, presence: true
    validates :start_date, presence: true
    validates :days_to_complete, presence: true
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
