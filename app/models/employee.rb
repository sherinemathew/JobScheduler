class Employee < ApplicationRecord
    has_many :employee_jobs
    has_many :jobs, through: :employee_jobs

    def name
        return "#{first_name} #{last_name}"
    end
end
