json.extract! isee_card, :id, :code, :date, :phone, :email, :name, :surname, :use_type_id, :location_id, :user_id, :completion_date, :completed :created_at, :updated_at
json.url isee_card_url(isee_card, format: :json)
