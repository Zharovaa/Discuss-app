defmodule Discuss.TopicContextTest do
  use Discuss.DataCase

  alias Discuss.TopicContext

  describe "topics" do
    alias Discuss.TopicContext.Topic

    import Discuss.TopicContextFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert TopicContext.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert TopicContext.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Topic{} = topic} = TopicContext.create_topic(valid_attrs)
      assert topic.description == "some description"
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TopicContext.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Topic{} = topic} = TopicContext.update_topic(topic, update_attrs)
      assert topic.description == "some updated description"
      assert topic.title == "some updated title"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = TopicContext.update_topic(topic, @invalid_attrs)
      assert topic == TopicContext.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = TopicContext.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> TopicContext.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = TopicContext.change_topic(topic)
    end
  end
end
