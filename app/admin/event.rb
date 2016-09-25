ActiveAdmin.register Event do

  permit_params :name, :starts_at, :ends_at, :address, :city_id,
                conversation_topics_attributes: [:id, :title, :_destroy]

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute

    f.inputs do
      f.has_many :conversation_topics do |a|
        a.input :title
      end
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end