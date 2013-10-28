json.array!(@templates) do |template|
  json.extract! template, :name
  json.url template_url(template, format: :json)
end
