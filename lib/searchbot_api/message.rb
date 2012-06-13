require "searchbot_api/client"

module SearchbotApi
  class Message
    attr_accessor :content, :user_id, :id, :chat_room_id, :created_at, :user_name

    def initialize(attributes)
      self.id           = attributes["id"]
      self.content      = attributes["content"]
      self.user_id      = attributes["user_id"]
      self.chat_room_id = attributes["chat_room_id"]
      self.created_at   = attributes["created_at"]
      self.user_name    = attributes["user_name"]
    end

    def self.client=(client)
      @client = client
    end

    def self.client
      @client ||= SearchbotApi::Client.new
    end

    def self.search(query)
      messages_attributes = client.get('/messages', :query => query)

      messages_attributes.map do |attributes|
        SearchbotApi::Message.new(attributes["message"])
      end
    end
  end
end