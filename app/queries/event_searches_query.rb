# Finds saved events searches, matching new event
class EventSearchesQuery
  attr_accessor :scope, :event

  def initialize(scope = EventsSearch.all, event)
    self.scope = scope
    self.event = event
  end

  def search
    new_scope = scope
    new_scope = new_scope.merge(EventsSearch.where(city: event.city).or(EventsSearch.where(city: nil)))
    new_scope = new_scope.merge(EventsSearch.where("? ILIKE '%'||name||'%'", event.name))
    new_scope = new_scope.merge(EventsSearch.where('to_date >= ?', event.starts_at.to_date).or(EventsSearch.where(to_date: nil)))
    new_scope = new_scope.merge(EventsSearch.where('from_date <= ?', event.ends_at.to_date).or(EventsSearch.where(from_date: nil)))
    new_scope
  end
end