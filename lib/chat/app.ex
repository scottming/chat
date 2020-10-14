defmodule Chat.App do
  use Commanded.Application, otp_app: :chat

  router Chat.Router
end
