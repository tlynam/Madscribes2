defmodule Madscribes2.PageView do
  use Madscribes2.Web, :view

  def chat_placeholder(current_user) do
    if current_user, do: "Send a message:", else: "Sign in to chat"
  end

  def disable_input?(current_user) do
    if current_user, do: "", else: "disabled"
  end
end
