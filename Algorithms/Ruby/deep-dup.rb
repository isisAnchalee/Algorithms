class Array
  def deep_dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el)
    end
    new_array
  end

  def dd_inject
    inject([]) { |dup, el| dup << (el.is_a?(Array) ? el.dd_inject : el) }
  end

  def dd_map
    map { |el| el.is_a?(Array) ? el.dd_map : el }
  end
end
