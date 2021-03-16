json.extract! order, :id, :name, :po_number, :date_recieved, :date_delivered, :distributed_by, :vendor_id, :created_at, :updated_at
json.url order_url(order, format: :json)
