class CreateConversationTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_topics do |t|
      t.references :event, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
