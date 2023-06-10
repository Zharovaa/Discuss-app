defmodule Discuss.TopicContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.TopicContext` context.
  """

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Discuss.TopicContext.create_topic()

    topic
  end
end
