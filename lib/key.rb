class Key
  NUMS = ("00000".."99999").to_a

  def self.make
    NUMS.sample
  end
end
