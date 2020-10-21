alias Chat.Communication
alias Chat.Accounts

# user_attrs = %{username: "scott", email: "scott@example.com", password: "abcabc"}
# {:ok, user} = Accounts.register_user(user_attrs)

# channel_attrs = %{name: "room1", owner_uuid: user.uuid}
# {:ok, channel} = Communication.create_channel(channel_attrs)

user_attrs = %{username: "yadong", email: "yadong@example.com", password: "abcabc"}
{:ok, user} = Accounts.register_user(user_attrs)
