class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.interger :user_id
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :contact_email
      t.text :description
      t.timestamps
    end
  end
end
