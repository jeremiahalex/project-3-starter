module ApplicationHelper
  def online_status(user)
    # naming = user.space ? user.space.company_name : user.username
    # content_tag :span, naming,

  content_tag :span, user.username,
              class: "user-#{user.id} online_status #{'online' if user.online?}"
end
end
