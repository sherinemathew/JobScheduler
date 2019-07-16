class CreateEmployeeJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_jobs do |t|
      t.references :job, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
