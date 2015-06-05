class Message < ActiveRecord::Base

  is_private_message
  attr_accessible :recipient_id, :subject, :body, :read_at, :sender_id

  
end