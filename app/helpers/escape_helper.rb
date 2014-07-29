require 'cgi'

helpers do
  def escape_string(str)
    CGI.escape(str)
  end
end