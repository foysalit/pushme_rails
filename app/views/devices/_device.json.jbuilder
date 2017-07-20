json.extract! device, :id, :model, :uuid, :token, :platform, :created_at, :updated_at
json.url device_url(device, format: :json)
