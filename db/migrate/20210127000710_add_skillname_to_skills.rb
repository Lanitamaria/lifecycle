class AddSkillnameToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :skillname, :text
  end
end
