require 'spec_helper'

class SearchbotApi::TestClient
  def get(path, params)
    [{"message" => {"id" => 123, "content" => "foo bar baz", "user_id" => 123, "chat_room_id" => 42, "created_at" => Time.now, "user_name" => "cool_user"}}]
  end
end

describe SearchbotApi::Message do
  describe ".search" do
    it "returns SearchbotApi::Message objects" do
      test_client = SearchbotApi::TestClient.new
      SearchbotApi::Message.client = test_client

      messages = SearchbotApi::Message.search("foo")
      messages.count.should == 1
      messages.first.content.should == "foo bar baz"
    end
  end
end