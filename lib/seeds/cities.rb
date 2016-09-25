module Seeds
  module Cities
    class << self
      def load
        moscow
        spb
      end

      def moscow
        @moscow ||= City.find_or_create_by name: 'Москва'
      end

      def spb
        @spb ||= City.find_or_create_by name: 'Санкт-Петербург'
      end
    end
  end
end