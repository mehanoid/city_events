class CreateConversationMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_messages do |t|
      t.references :conversation_topic, foreign_key: true
      t.string :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
