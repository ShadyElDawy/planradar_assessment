# spec/models/ticket_spec.rb
require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:user) do
    User.create!(
      name: "Shady ElDawy",
      mail: "shadyeldawy989@any.com",
      send_due_date_reminder: true,
      due_date_reminder_interval: 1,
      due_date_reminder_time: Time.new(2000, 1, 1, 8, 0, 0),
      time_zone: "Europe/Vienna"
    )
  end

  describe "#update" do
    let(:ticket) do
      Ticket.create!(
        title: "New Ticket",
        assigned_user: user,
        due_date: Date.new(2024, 12, 31),
        status_id: 1,
        progress: 90
      )
    end

    it "updates the due date" do
      ticket.update(due_date: Date.new(2025, 1, 1))
      expect(ticket.reload.due_date).to eq(Date.new(2025, 1, 1))
    end

  end

  describe "#destroy" do  
    let!(:ticket) do
      Ticket.create!(
        title: "New Ticket",
        assigned_user: user,
        due_date: Date.new(2024, 12, 31),
        status_id: 1,
        progress: 50
      )
    end
  
    it "destroys the ticket" do
      ticket_id = ticket.id
      ticket.destroy
      expect(Ticket.exists?(ticket_id)).to be_falsey
    end
  
  end
end
