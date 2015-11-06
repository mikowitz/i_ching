module HasAttributes
  attr_accessor :attributes

  def has_attributes(*args)
    @attributes = args
    instance_eval { attr_reader *@attributes }
  end

  def self.included(base)
    base.extend(self)
  end

  def initialize(args)
    args.each do |k, v|
      next unless self.class.attributes.include?(k)
      instance_variable_set("@#{k}", v)
    end
  end

  def to_h
    Hash[self.class.attributes.map do |key|
      [key, self.send(key)]
    end]
  end

  def to_json
    JSON.generate(self.to_h)
  end
end
