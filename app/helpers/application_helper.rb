module ApplicationHelper
  def gravatar_for(chatuser, opts = {})
    opts[:alt] = chatuser.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end
end
