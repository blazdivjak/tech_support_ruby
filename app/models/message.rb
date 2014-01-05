class Message < ActiveRecord::Base
  belongs_to :ticket, :foreign_key => "ticket_id"
end
