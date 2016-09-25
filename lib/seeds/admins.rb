module Seeds
  module Admins
    class << self
      def load
        User.find_or_create_by email: 'admin@example.com' do |user|
          user.assign_attributes password: '12345678', admin: true
        end
      end
    end
  end
end