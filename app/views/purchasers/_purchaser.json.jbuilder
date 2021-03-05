json.extract! purchaser, :id, :name, :po_number, :date_recieved, :date_delivered, :distributed_by, :user_id, :created_at, :updated_at
json.url purchaser_url(purchaser, format: :json)
