require 'digest/md5'

module UsersHelper

  def user_avatar_link(user)
    # https://cn.gravatar.com/
    email_md5 = Digest::MD5.hexdigest(user.email)
    gravatar_url = "https://www.gravatar.com/avatar/#{email_md5}"

    # "<div class ='user-link'>".html_safe + link_to(image_tag(gravatar_url), user_path(user)) + " " + user.display_name + "</div>".html_safe

    content_tag(:div,
      link_to(image_tag(gravatar_url), user_path(user)) + " " + user.display_name ,
      :class => "user-link" )
  end

end
