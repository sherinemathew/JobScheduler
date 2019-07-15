class AddJobToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :job, foreign_key: true, optional: true
  end
end
