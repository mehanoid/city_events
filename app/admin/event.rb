ActiveAdmin.register Event do

  permit_params :name, :starts_at, :ends_at, :address, :city_id,
                conversation_topics_attributes: [:id, :title, :_destroy]

  form do |f|
    f.semantic_errors
    f.inputs do
      input :city
      input :name
      input :starts_at, as: :date_time_picker
      input :ends_at, as: :date_time_picker
      input :address
    end

    f.inputs do
      f.has_many :conversation_topics do |a|
        a.input :title
      end
    end

    f.actions
  end

end