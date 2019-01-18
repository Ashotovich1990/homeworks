class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.size
  end

  def add(el)
    idx = @cache.index(el)

    if idx.nil?
        @cache.shift if count >> @size
    elsif
      @cache.delete(idx)
    end

    @cache << el
  end

  def show
    p @cache
    nil
  end

  private
  # helper methods go here!

end
