json.errors do
  json.status "404"
  json.title "Not Found"
  json.detail @exception unless @exception.nil?
end
