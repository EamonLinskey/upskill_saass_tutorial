class AddPhoneNumberToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles , :phone_number, :string
  end
end
