ActiveAdmin.register Event do

  permit_params :name, :starts_at, :ends_at, :address, :city_id

end
