class Employee < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true
    has_many :employee_jobs
    has_many :jobs, through: :employee_jobs

    def name
        return "#{first_name} #{last_name}"
    end
end
