class EventQuery
  attr_accessor :scope, :search_query

  # @param [ActiveRecord::Relation<Event>] initial events scope
  # @param [EventSearch] search_query object
  def initialize(scope = Event.all, search_query)
    self.scope = scope
    self.search_query = search_query
  end

  def search
    new_scope = scope
    if search_query.city
      new_scope = new_scope.where(city: search_query.city)
    end

    if search_query.name.present?
      new_scope = new_scope.where('name ILIKE ?', "%#{search_query.name}%")
    end

    if search_query.from_date
      new_scope = new_scope.where('ends_at >= ?', search_query.from_date.end_of_day)
    end

    if search_query.to_date
      new_scope = new_scope.where('starts_at <= ?', search_query.to_date.beginning_of_day)
    end

    new_scope
  end
end