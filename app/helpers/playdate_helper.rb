module PlaydateHelper

  def sanitize_search_term(search_term)
    cleaned = search_term.to_s.downcase.tr(" ", "+").chomp
  end

end
