class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    puts data
    Comment.create!(content: data["message"], room_id: data["room_id"])
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
