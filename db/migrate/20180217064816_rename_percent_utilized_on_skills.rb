class RenamePercentUtilizedOnSkills < ActiveRecord::Migration[5.1]
  def change
    remove_column :skills, :percent_utilized
    add_column :skills, :percent_completed, :integer
  end
end
