helpers do
  def title
    @title || "TeaShirts"
  end
   
  def cache(key, options={}, &block)
    if settings.cache?
      return settings.cache.get(key) if settings.cache.get(key)

      value = block.call
      settings.cache.set(key, value, options[:ttl])
      return value
    end

    block.call
  end
   
end

