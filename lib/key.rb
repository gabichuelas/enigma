class Key
  NUMS = ("00000".."99999").to_a

  # def self.make
  #   num = rand(99999).to_s
  #   num.prepend("0") until num.length == 5
  #   num
  # end
  def self.make
    NUMS.sample
  end
end
