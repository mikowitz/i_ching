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
end
