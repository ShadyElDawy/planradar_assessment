require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(
      name: "Shady Eldawy",
      mail: "shadyeldawy9682@gmail.com",
      send_due_date_reminder: true,
      due_date_reminder_interval: 1,
      due_date_reminder_time: Time.new(2000, 1, 1, 8, 0, 0),
      time_zone: "Europe/Vienna"
    )
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end
end