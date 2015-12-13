module API
  def self.cast(casting_method, &block)
    block.call({
                 "lines" => [6, 7, 8, 9, 8, 7],
                 "stable" => 64,
                 "changed" => 41
               })
  end
end
