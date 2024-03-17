class CreateScheduledJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_jobs do |t|
      t.references :ticket, foreign_key: true
      t.string :job_id

      t.timestamps
    end
  end
end
