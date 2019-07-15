class Employee < ApplicationRecord
    belongs_to :job, optional: true

    def name
        return "#{first_name} #{last_name}"
    end
end
