json.extract! customer_information, :id, :title, :body, :created_at, :updated_at
json.url customer_information_url(customer_information, format: :json)
